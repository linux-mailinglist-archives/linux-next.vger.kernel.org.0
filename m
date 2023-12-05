Return-Path: <linux-next+bounces-237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC243805B1D
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 18:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC8C61C20CC4
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 17:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7680A675D3;
	Tue,  5 Dec 2023 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KNbRFJJw"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E053ACA;
	Tue,  5 Dec 2023 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=30oCHSjV0XJwpBvR0k7CZ9r6hmyCke0MwtbeOyHxYIM=; b=KNbRFJJwUKVKBvjeg9UI1heulT
	STPx/h/pj4mkBG4hUsQqS+/eAX2Jx1iihQ2aYw+ih7WOEwNGqlZy4MnVfIIP0spZmY7Fs4HCvz+57
	Qow9ui0tOI9skbgagNIA6S95EJNH3SIaClbhE+E08zw64/K6dKmPsfWXu7uvTc/KpJOV0oVdQytDM
	AbHImRJ+brjQV8E+ZacSkmDqLLt94iiCv1XO890Dsyit+5d7lodxEO6OaVTRz0useJ+Q8LdAMCVTa
	eTvvgYEVkO9e7kjUcVDRg8xVQ9n8kNQiH0o6T9H8v7hsVobuaaIPOmW5AOs9+6JSrUL5rDwryY+tM
	P6oES21Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZEI-0082LS-0W;
	Tue, 05 Dec 2023 17:29:06 +0000
Message-ID: <a173781e-b3b6-47a7-8bda-fb289fd9ffd5@infradead.org>
Date: Tue, 5 Dec 2023 09:29:05 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Dec 5 (soc/qcom/qcom_stats)
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231205135708.4a5a8413@canb.auug.org.au>
 <50d8f1dd-4df2-446a-bd82-47d96637b507@infradead.org>
In-Reply-To: <50d8f1dd-4df2-446a-bd82-47d96637b507@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/23 09:17, Randy Dunlap wrote:
> 
> 
> On 12/4/23 18:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20231204:
>>
> 
> on powerpc 32-bit:
> 
> ERROR: modpost: "__udivdi3" [drivers/soc/qcom/qcom_stats.ko] undefined!
> 
> 

Hi,

Looks like this is coming from the use of mult_frac() if I am reading the
generated .s file correctly:

 # ../drivers/soc/qcom/qcom_stats.c:224: 		entry[i].dur = mult_frac(MSEC_PER_SEC, entry[i].dur, ARCH_TIMER_FREQ);
	mulhwu 3,22,4	 # tmp194, tmp190, MEM[(long long unsigned int *)_107 + 16B]
	mulli 9,9,1000	 # tmp185, MEM[(long long unsigned int *)_107 + 16B],
	mulli 4,4,1000	 # tmp3, MEM[(long long unsigned int *)_107 + 16B],
	add 3,9,3	 #, tmp185, tmp194
	bl __udivdi3		 #

-- 
~Randy

