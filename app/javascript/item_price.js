window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const proFitDom = document.getElementById("profit");
  
  const recalculateAndDisplay = () => {
    const inputValue = parseFloat(priceInput.value);
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;
    proFitDom.innerHTML = Math.floor(inputValue - tax);
  };
  
  // 初回の計算
  recalculateAndDisplay();
  
  // 再度価格が入力された場合に再計算する
  priceInput.addEventListener("input", recalculateAndDisplay);
});
