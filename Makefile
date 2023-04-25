CFLAGS     :=  
LFLAGS     :=  

SRC_DIR    :=  src
BIN_DIR    :=  bin
INC_DIR    :=  inc
TARGET_DIR :=  target

SRCS       :=  $(shell find $(SRC_DIR) -type f -name \*.c)
BINS       :=  $(SRCS:$(SRC_DIR)/%.c=$(BIN_DIR)/%.o)

TARGET     :=  rcs

$(TARGET_DIR)/$(TARGET): $(BINS)
	@mkdir -p $(@D)
	$(CC) -o $@ $(BINS) $(LFLAGS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ -I$(INC_DIR) $(CFLAGS)

.PHONY: run mrproper

run: $(TARGET_DIR)/$(TARGET)
	@./$(TARGET_DIR)/$(TARGET)

mrproper:
	rm -rf $(BIN_DIR) $(TARGET_DIR)
