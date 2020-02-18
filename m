Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EFB16244A
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 11:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgBRKKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 05:10:24 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:16086 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726293AbgBRKKY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 05:10:24 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01IA1LFv008454;
        Tue, 18 Feb 2020 04:10:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=7C3WqxU7agsBY/SV9N06VqS8zd5zedsNtq9mPxpHcVo=;
 b=N9GN9QtlEK4wicayZdVMUNi3AzFIrZEiwzXLlzxOfuI7yaunRJtaiDTj71aamKf0fMn9
 SBT+eoCLOwGin1aqqFH/lhDajXtSBGd9U5vtcX5+FTmmONpA6hGImOxWEagV6ySjDB1t
 o/+ybKPiLpKYvWB351lzv1ASF5LRLFsX/LsCLPfkwSyuS8cl7dvn9o3RpwRE+UJ9cieK
 o7K8TWg7+mWl/AArcQMtA2FWQZNzBcThXQNCusPnvfKHF3c01OmxAznpFKZDZ6T377X9
 Y3fkEMJZ1r34jYZjF5cle1gts1wGdAk5SalgdPfONXO42assPqdAJJSsNLxUZWmna4RC 4Q== 
Authentication-Results: ppops.net;
        spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
        by mx0b-001ae601.pphosted.com with ESMTP id 2y6dxw3vru-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 18 Feb 2020 04:10:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 18 Feb
 2020 10:09:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 18 Feb 2020 10:09:59 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 500272AB;
        Tue, 18 Feb 2020 10:09:59 +0000 (UTC)
Date:   Tue, 18 Feb 2020 10:09:59 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Mark Brown <broonie@kernel.org>,
        <patches@opensource.cirrus.com>, <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
Message-ID: <20200218100959.GD108283@ediswmail.ad.cirrus.com>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
 <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180080
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 17, 2020 at 11:05:49PM -0800, Randy Dunlap wrote:
> [resending to broonie@kernel.org; other email address got message too big for mailbox]
> 

Will have a word with our IT guys, Mark's
opensource.wolfsonmicro.com account certainly shouldn't still be
accepting email.

> 
> On 2/17/20 11:04 PM, Randy Dunlap wrote:
> > On 2/17/20 8:28 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200217:
> >>
> > 
> > on x86_64:
> > 
> > WARNING: unmet direct dependencies detected for SND_SOC_WM5110
> >   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]
> >   Selected by [y]:
> >   - SND_SOC_BELLS [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (MACH_WLF_CRAGG_6410 || COMPILE_TEST [=y])
> >   - SND_SOC_SAMSUNG_TM2_WM5110 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
> > 
> > 
> > Full randconfig file is attached.
> > 
> 

This looks like it comes from these two patches:

ea00d95200d0 ("ASoC: Use imply for SND_SOC_ALL_CODECS")
d8dd3f92a6ba ("ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout")

What is happening is the machine drivers still select these
symbols but this doesn't take account of the dependencies, which
are now added by the second of those patches.

I guess there are a couple of options:

1) We could update the machine drivers to do an imply as well,
like the changes to SND_SOC_ALL_CODECS. I think this will
generally work but doesn't really feel right as you can end up with
the machine driver built without the CODEC.

2) We could update the machine drivers to a depends on and make
the CODEC symbols manually selectable. I guess this also has the
advantages that it would be necessary for the simple card stuff
that seems to be everyones first choice for machine drivers these
days.

Mark do you have any strong feelings on this I am leaning towards
2?

Thanks,
Charles
