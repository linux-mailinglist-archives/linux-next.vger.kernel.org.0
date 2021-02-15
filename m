Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1A731B7A7
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBOKvY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:51:24 -0500
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:57218 "EHLO
        17.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhBOKvV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 05:51:21 -0500
X-Greylist: delayed 6874 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Feb 2021 05:51:20 EST
Received: from player693.ha.ovh.net (unknown [10.110.115.149])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3489523EA94
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 09:56:02 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player693.ha.ovh.net (Postfix) with ESMTPSA id 18B261B083216;
        Mon, 15 Feb 2021 08:55:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0052bc91e7f-3b4f-47e7-9a55-0b1cfc3b4324,
                    B556E4132F97FCF51F74662465CB03FCA76A52B8) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: linux-next: build failure after merge of the mtd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210215122854.4103ef4d@canb.auug.org.au>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <b5b62cbc-88a3-c865-d3be-8a86018d822c@milecki.pl>
Date:   Mon, 15 Feb 2021 09:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210215122854.4103ef4d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3972456348547190357
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrieejgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeehnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeehveellefgjefgtddtleeijeegudffheejudffgeeigffhjeelgfevleegheekieenucffohhmrghinhepohiilhgrsghsrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen!

On 15.02.2021 02:28, Stephen Rothwell wrote:
> After merging the mtd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/mtd/parsers/bcm4908-partitions.o
> ERROR: modpost: "bcm4908_partitions_post_parse" [drivers/mtd/parsers/ofpart.ko] undefined!
> 
> Caused by commit
> 
>    09cf6ee6d21c ("mtd: parsers: ofpart: support BCM4908 fixed partitions")
> 
> I have used the mtd tree from next-20210212 for today.

Thank you for the report!

It has been fixed by the
[PATCH] mtd: parsers: ofpart: fix building as module
https://patchwork.ozlabs.org/project/linux-mtd/patch/20210215072844.16136-1-zajec5@gmail.com/
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=mtd/next&id=bc6dcf44da2bea215ae3edbdac5d350e96de3996
