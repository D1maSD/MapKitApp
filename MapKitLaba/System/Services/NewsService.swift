//
//  NewsService.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 22.12.2022.
//

import Foundation
import UIKit


protocol NewsSecviceProtocol {
    
    var newsItems: [NewsItem] { get set }
    func fetchNews() -> [NewsItem]
    
}

final class NewsService: NewsSecviceProtocol {
        
    var newsItems: [NewsItem] = [
        NewsItem(newsMaker: "CNN", title: "Temperatures on Greenland haven’t been this warm in at least 1,000 years, scientists report", info: "As humans fiddle with the planet’s thermostat, scientists are piecing together Greenland’s history by drilling ice cores to analyze how the climate crisis has impacted the island country over the years. The further down they drilled, the further they went back in time, allowing them to separate which temperature fluctuations were natural and which were human-caused. After years of research on the Greenland ice sheet – which CNN visited when the cores were drilled – scientists reported Wednesday in the journal Nature that temperatures there have been the warmest in at least the last 1,000 years – the longest amount of time their ice cores could be analyzed to. And they found that between 2001 and 2011, it was on average 1.5 degrees Celsius warmer than it was during the 20th century. The report’s authors said human-caused climate change played a significant role in the dramatic rise in temperatures in the critical Arctic region, where melting ice has a considerable global impact. Greenland is the largest contributor currently to sea level rise,” Maria Hörhold, lead author of the study and a glaciologist with the Alfred Wegener Institute, told CNN. “And if we keep on going with the carbon emissions as we do right now, then by 2100, Greenland will have contributed up to 50 centimeters to sea level rise and this will affect millions of people who live in coastal areas.", likes: 112, dislikes: 1, stars: 2, image: UIImage(named: "news1") ?? UIImage(), timePassed: "13 min"),
        
        NewsItem(
            newsMaker: "CNN",
            title: "Jonathan Knight reveals he was forced to hide his sexuality in early days of New Kids on the Block",
            info: "New Kids on the Block star Jonathan Knight has revealed that he was pressured into hiding his sexuality during the band’s early days. Knight, now 54, said that the band’s manager at the time knew that he was gay, but urged him to keep his sexuality a secret. One fifth of the Massachusetts-based boy band, Knight revealed last year that he had married his longtime partner, Harley Rodriguez. But much has changed since he and his bandmates – his brother Jordan Knight, Donnie Wahlberg, Danny Wood and Joey McIntyre – shot to fame in the 1980s. Speaking to Frosted Tips, a podcast hosted by former NSYNC member Lance Bass, Knight said of the group’s manager: “He pulled me aside and he was like ‘if anybody finds out then your career is over, the New Kids’ career is over,’ my manager said, ‘my career is over … Sony’s going to, like, lose money.’” It was just so much pressure,” he added. “Looking back, that’s a lot of pressure to put on somebody who is just trying to figure out the world themselves. He recalled being the first to leave the band in 1994, saying: “Pop music was just not what it used to be and you know we went from arenas down to theaters and then eventually I left the New Kids and they continued on and they were doing nightclubs. And it just kept going down and down but I had jumped out early.", likes: 9, dislikes: 1, stars: 2, image: UIImage(named: "news2") ?? UIImage(), timePassed: "32 min"),
        
        NewsItem(newsMaker: "RT", title: "Italy’s Friuli region is one of Europe’s best kept secrets", info: "Its mountains, canyons, beaches and lagoons make it one of Italy’s most beautiful and varied landscapes, but few people – and that includes Italians – know anything about it. Perhaps because it’s tucked away on the country’s northeastern border with Slovenia and Austria, perhaps because of a history of invasions, including the Austro-Hungarian empire, or perhaps because of the many languages spoken by locals, it barely seems like part of Italy. But although Friuli Venezia Giulia stretches from the snow-capped Alpine reaches of the Dolomites to the sun-kissed waters of the northern Adriatic sea, it never experiences the crowds that leave some parts of Italy straining in the summer. And yet, say locals, it’s every bit as worth visiting as the rest of Italy. “Unlike other Italian regions, we’re not advertised and are far from mass tourism,” says local tour guide Roberta Bressan. “Ours is a small-scale, niche reality travelers should discover bit by bit, made of a constellation of beautiful tiny towns and different traditions.”", likes: 13, dislikes: 1, stars: 2, image: UIImage(named: "news3") ?? UIImage(), timePassed: "40 min")
    ]
    
    func fetchNews() -> [NewsItem] {
        return newsItems
    }
}
