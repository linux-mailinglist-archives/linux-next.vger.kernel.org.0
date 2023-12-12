Return-Path: <linux-next+bounces-357-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B080E7CF
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F36CB210A2
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4109584FA;
	Tue, 12 Dec 2023 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cKGwXTZY"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C81FDB;
	Tue, 12 Dec 2023 01:35:15 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC70GcA016663;
	Tue, 12 Dec 2023 03:35:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=75G6b+827uYHMO0
	0ZmcSTAjr7pIn63myPK48OyBOHsA=; b=cKGwXTZYQxQwXWYVEEXQjJb1ZkGgsOh
	LJJ/sKFmjCC/yif3yLcM4RE2Tgqz1Q1LURIT6hqiSZ/u+/zxqVCzKDwbyhJcHiqU
	I7x/QqtEu26ZQ6BsQGndf7C6EZEe+0XVbbRIiGqFJwNubm+/G363EV7u7BYeVdvq
	l2b/3PTHvQvJaXTnOUlQYh26NTJQUy2MVI0nhNemgh+0/H/+M4dGBJwdRL0gyiGj
	CxiJl968GLMCGrka7LKtUhsKsJklqYsBYP/mKuEFbiKI4OH9UYBbN/CFjNj1rrHq
	wfN1n/0vZm+aIHSCVxEKUAWp0ie2xVaqrL5+LUKvgpvsd11gIoHigCQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpjxsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 03:35:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 09:35:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 12 Dec 2023 09:35:02 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1B21F468;
	Tue, 12 Dec 2023 09:35:02 +0000 (UTC)
Date: Tue, 12 Dec 2023 09:35:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing
 List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20231212093502.GW14858@ediswmail.ad.cirrus.com>
References: <20231212111625.2b9cf396@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212111625.2b9cf396@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LGc9cVkf1D_G27hJKIBvQ7hblcugw1ij
X-Proofpoint-ORIG-GUID: LGc9cVkf1D_G27hJKIBvQ7hblcugw1ij
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 12, 2023 at 11:16:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> sound/soc/codecs/cs42l43.c:142:6: warning: no previous prototype for 'cs42l43_hp_ilimit_clear_work' [-Wmissing-prototypes]
>   142 | void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/cs42l43.c:159:6: warning: no previous prototype for 'cs42l43_hp_ilimit_work' [-Wmissing-prototypes]
>   159 | void cs42l43_hp_ilimit_work(struct work_struct *work)
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   bbbc18d8c27c ("ASoC: cs42l43: Allow HP amp to cool off after current limit")
> 
> Maybe they should just be static?
> 

Yeah they should be static sorry, will send a patch today.

Thanks,
Charles

