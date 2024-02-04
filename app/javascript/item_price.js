window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    // 入力した金額に販売手数料（10%）を掛ける計算をする処理
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // 販売価格から販売手数料を引く処理
    profitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});