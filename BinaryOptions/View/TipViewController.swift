import UIKit
import SwiftGifOrigin

class CellView: UIView {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesx: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var ivImage: UIImageView!
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var page: UIPageControl!
    
    init() {
        
        self.bgImage = UIImageView()
        self.ivImage = UIImageView()
        self.lblDesx = UILabel()
        self.lblTitle = UILabel()
        self.lblSubTitle = UILabel()
        self.page = UIPageControl()
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

class TipViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    var items: [Int] = []
    var previousIndex = 0
    var arrImage = [String]()
    var arrTitle = [String]()
    var arrSubTitle = [String]()
    var arrDesc = [String]()
    
    @IBOutlet var carousel: iCarousel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in 1 ... 10 {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrImage = ["binary","tip2.PNG","tip3.png","alerts.png","nfp.png","loader","tip7.PNG","tip8.png","tip9.png","tip10.jpg"]
        arrTitle = ["1","2","3","4","5","6","7","8","9","10"]
        arrSubTitle = ["\"BINARY\" Trading Only",
                       "\"MAJOR PROFIT HACK\": Trade 24/7 all weekend with \"Over The Counter Options\" (OTC)",
                       "ALWAYS Select an option timeframe 1 hour or greater",
                       "Trade based on FOREX news releases, and NEVER \"Emotion\"",
                       "A Once a Month MUST TRADE opportunity, NON-FARM PAYROLL",
                       "NEVER trade unless you have a reliable mobile or desktop datalink. We HIGHLY recommend trading only when on solid 4G/5G, broadband etc.",
                       "If Your Position is \"UNRECOVERABLE\", Sell Your Option Early",
                       "\"PROFIT HACK\". Always choose the LOWER profit return FOREX pairs, 58%-70%",
                       "ALWAYS place 20% of your largest trades as end of month options",
                       "DON’T DELETE THIS APP, EVER"]
        
        arrDesc = ["We have received thousands of tips and advice since the inception of this app. And we have gathered data from the most successful IQ Option traders. The most important tip was to trade \"Binary\" only and not \"Turbo\" trade. Binary trading is less volatile, with reduced risk and forex fluctuation. On your mobile device, this is selectable from the \"Binary\" dropdown, from the upper trading dashboard menu.",
                   "Our traders are reporting that they are earning increased profits by trading FOREX \"Over The Counter\" Options, on the Mobile trading app. The Saturday and Sunday trading environment is less volatile and far less kinetic. Some traders have reported profit increases of 85%, compared to general weekly trading. So next time you are bored on a weekend, try OTC trading with your mobile device, and PROFIT !",
                   "Now that you are safely \"Binary\" trading and NOT \"Turbo\" trading, in accordance with Tip No#1. You should now select an extended option timeframe. Our traders have reported the highest profits, if the option is a 60+ minute timeframe. The reduced frequency trading, significantly reduces risk by a factor of 67%, and hence increases profit potential. We acknowledge that it may be less exciting, and less heart pumping, however at the end of the day \"Profit is King\". So please resist the temptation of \"Turbo\" trading.",
                   "NEVER trade based on emotion, whether it's happiness, anger or frustration. Only ever trade based on facts. Major impact FOREX currency pairs news events, present ideal unemotional trading opportunities. Within the app we have provided a list of the most critical FOREX news events for the month. We have detailed the date, currency pair, GMT time and trading trends. So please ALWAYS refer to our \"Trading Alerts\" section when trading.",
                   "Each month we send all app users a \"Push-Notification\" 60 minutes prior to the relaese of the US NFP resullts. This is a MUST TRADE once a month opportunity.\n\nWhat is the 'Nonfarm Payroll'\n\nNonfarm payroll is a monthly report generated and reported by the U.S. Bureau of Labor Statistics intended to represent the total number of paid U.S. workers of any business. Despite the name nonfarm payroll, the report excludes workers from general government jobs, private household jobs, employees of nonprofit organizations and farm employees.\n\nBREAKING DOWN 'Nonfarm Payroll'\n\nThe nonfarm payroll statistic is reported monthly, on the first Friday of the month, and is used to assist government policymakers and economists with determining the current state of the economy and predicting future levels of economic activity\n\nWhy the Nonfarm Payroll Report Matters\n\n\n\nThe major statistic reported from the nonfarm payroll report is the number of additional jobs added from the previous month. The report also contains many valuable insights into the labor force that have a direct impact on the stock market, the value of the U.S. dollar and the price of gold. The nonfarm payroll report is a major tool used to determine the overall health of the economy. The total nonfarm payroll accounts for approximately 80% of the workers who produce the entire gross domestic product (GDP) of the United States.  The nonfarm payroll report shows statistics of unemployment for the U.S workforce. This is communicated through an overall unemployment rate, a long term unemployment rate and a youth unemployment rate. The labor force participation rate is also a key statistic used to determine the true unemployment rate of the country. What the Nonfarm Payroll Reports  Statistics from the nonfarm payroll also show which sectors are generating the most employment additions. The report shows large gains and losses among the sectors. The list of sectors from the report include professional and business services, health care, financial activities, mining, construction, manufacturing, wholesale trade, retail trade, transportation and warehousing, information, and leisure and hospitality. This breakdown by sector is often used by stock analysts to predict which stocks and sectors have strong earnings reports.  The report also contains additional items such as the average work week and average hourly earnings. Wage growth is communicated with the report. Each month’s report may include revisions to previous reports.  The best month for wage growth is usually May with an average of 129,000 additional jobs. August is the worst month with an average of 69,000 additional jobs. The year 1994 was the best on record with 3.85 million added jobs. That year saw gains reported in every monthly nonfarm payroll report. In 2009, the job force lost 5.05 million jobs, marking the worst statistical year for the nonfarm payroll.",
                   "You will notice as the IQ Option trading console loads on your mobile device, the following warning advisory will be displayed. \"FOR OPTIMAL PERFORMANCE A HIGH-SPEED CONNECTION IS RECOMMENDED\". Due to the volatile and rapid high frequency trading, that is Binary Options, we highly recommend adhering to this warning.",
                   "You can now sell the option before expiration ! By selling your option before expiration time you can now prevent your losses or fix the profit. And the new expirations panel will help you make a wiser choice.",
                   "You will notice that IQ Option offers up to 92% Profit on options trades. However our statistics and feedback have determined that, the higher the profit return offered (ie: 92%), the higher the volatility. Most highly successful traders have actually made larger profits by targeting the lower return FOREX pairs. Generally it is recommended to trade FOREX pairs offering a profit return between 58%-70%.",
                   "In accordance with the Tip#1 recommendation of \"NON\" Turbo trading. Our most successful traders have allotted 20% of their investment capital, towards \"End of the Month\" options. They have reported an overall 43% increase in monthly profits, as a result of this more disciplined trading style.",
                   "WHY SHOULD YOU KEEP THIS APP ?\n\n1. Real time FREE daily and weekly Stock alert \"push-notifications\"\n\n2. Access to the Daily in-app \"Trading Alerts\" section, find out when to trade particular FOREX pairs\n\n3. We deliver daily and monthly exclusive promo codes\n\n4. We are constantly updating our Top#10 Tips and IQ Option \"Hacks\". Based on actual IQ Option traders feedback.\n\n5. If you want to succeed with IQ Option, and actually make a daily profit, this app is absolutely \"ESSENTIAL\""
        ]
        
        carousel.type = .wheel
        carousel.isPagingEnabled = true
        carousel.delegate = self
        carousel.dataSource = self
        carousel.reloadData()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return arrTitle.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: CellView
        
        if view != nil {
            itemView = view as! CellView
        }
        else {
            let theNibArray = Bundle.main.loadNibNamed("CellView", owner: self, options: nil)
            itemView = theNibArray?[0] as! CellView
            itemView.bgImage.layer.cornerRadius = 15
            itemView.bgImage.layer.masksToBounds = true

        }
        if(index == 0 || index == 5){
       
            // A UIImageView with async loading
            //let imageView = UIImageView()
            //imageView.loadGif(name: "jeremy")
            //itemView.ivImage.image.load
            //let p =  UIImageView.init()
            itemView.ivImage.loadGif(name: arrImage[index])
//            itemView.ivImage.loadGif(name: "loader.gif")
            //itemView.ivImage.image = UIImage.gif(name: )
            
        }else{
            itemView.ivImage.image = UIImage(named: "\(arrImage[index])")
        }
        itemView.lblTitle.text = "IQ OPTION - TIP NO#\(arrTitle[index])"
        itemView.lblSubTitle.text = arrSubTitle[index]
        itemView.lblDesx.text = arrDesc[index]
        
        itemView.page.numberOfPages = items.count
        itemView.page.currentPage = index
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if (option == .spacing) {
            //            if(UIScreen.main.bounds.size.height == 568) {
            return value * 1.85
            //            }
            //            else {
            //                return value * 1.65
            //            }
        }
        return value
    }	
    
    func carouselDidEndDecelerating(_ carousel: iCarousel) {
        
        let duration = 0.05
        let sizeOffset: CGFloat = 0.05
        
        if carousel.currentItemIndex != previousIndex {
            if (carousel.currentItemIndex == arrTitle.count - 1 && previousIndex == 0) {
                //Logic of animation for last and first index
                previousIndex = carousel.currentItemIndex
                
                DispatchQueue.main.async {
                    UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                        self.carousel.scrollOffset =  self.carousel.scrollOffset - sizeOffset
                        
                    }, completion: { (true) in
                        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                            self.carousel.scrollOffset =  self.carousel.scrollOffset + sizeOffset
                            
                        }, completion: nil)
                        
                    })
                }
            }
            else if (carousel.currentItemIndex > previousIndex) || (carousel.currentItemIndex == 0 && previousIndex == arrTitle.count - 1) {
                previousIndex = carousel.currentItemIndex
                DispatchQueue.main.async {
                    UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                        self.carousel.scrollOffset =  self.carousel.scrollOffset + sizeOffset
                        
                    }, completion: { (true) in
                        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                            self.carousel.scrollOffset =  self.carousel.scrollOffset - sizeOffset
                            
                        }, completion: nil)
                        
                    })
                }
                
            }
            else {
                previousIndex = carousel.currentItemIndex
                DispatchQueue.main.async {
                    UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                        self.carousel.scrollOffset =  self.carousel.scrollOffset - sizeOffset
                        
                    }, completion: { (true) in
                        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                            self.carousel.scrollOffset =  self.carousel.scrollOffset + sizeOffset
                            
                        }, completion: nil)
                        
                    })
                }
            }
        }
    }
}
