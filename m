Return-Path: <linux-next+bounces-9538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60BCCF1FDC
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 06:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F307A30124EB
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 05:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF61274B39;
	Mon,  5 Jan 2026 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8STReyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZUCrRXC"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390D31FC0EF
	for <linux-next@vger.kernel.org>; Mon,  5 Jan 2026 05:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767590886; cv=none; b=UI3KLSgTyJ2M3YBGT34rcoBMB2XfyeMuiRlAjggEV5Ti47JxWJZxkTgIr0tXoVOanfVCn2VEzPWeHpt4wlV22ebZ7YvQzw2rOW55FjjlaR4s4gH5u8JGhnBcc4mEx/Fw4JKN9lGX3S1Gj2QAbYgd5eiqgxUV+odrhJHVf6fKG+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767590886; c=relaxed/simple;
	bh=kKXJVDJ4D5qH3lZ0SNpaHt5T9s5B8LKUKbjmUzsOMB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SS55apTEFv0PLQK33y79kG70biFKqbkzgBQDO/ZynXBPB0WSzm9pCMQXa9tjfR59OhRmkqFKsAyFZC885R5NaOmhWlgIdAdv2rZcy5I+FLV+SF0ht8SDWA1gFqj1Sso8XPmnCtqAqf42zYvohCv27HG+Nyx1jL4E/UXRJG1ABDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8STReyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZUCrRXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604NaxCj3599146
	for <linux-next@vger.kernel.org>; Mon, 5 Jan 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=; b=p8STReybYQhbwnGy
	wNzUg7lL1ZW7z7QJkpPCMnINvfYraIv4VUFZ9waG50rdOmfCzCQCJ+zs1VRUlPko
	3M4a+g9RL79J86Sbze2/LnZBzs3eYkSmjI8qQMi5l+yQQHyV6emzO9im+aYdVADc
	yT1vHkIbNUv+IelL8Od/X2hIhomFJWSzBsuCo5Kzk/W6bcqn9eKiBKGH0NBPVi+a
	lJ4q9XmqlpiZicfHI2FoyBB/8vReH+e1TuQOTFV3h7ypvR5YxH/RiSC6AK2i+x1l
	4qqX+JAd6HJus+0O4rxmSFs5FeTwkmURvp0PGYL8KHTEudBIwznlSLy1u2lwyYtf
	wXrVKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertckhk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 05 Jan 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f4822f77so372404095ad.2
        for <linux-next@vger.kernel.org>; Sun, 04 Jan 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767590884; x=1768195684; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=;
        b=FZUCrRXCzs6agCR0sTkjHvxPBoitbC3IipeM2jVqfFSlV7ydlBPom+We//RxOeoF98
         FLkKQs2Ve+UfXAI3nSmVIEblxK9sENdM/qvIt0FzZ81H46HO9OscN4AoDm7gJXEgnMtr
         4Qz+jokxBQ2qc6v/HCuiGdiIBfE5OTFsla5goIfn9DvJvOn8+Bnc14b6VoQMVXWT3upF
         eh+RtC855bj0FHeFDA7LxlRjnAzdGWQyVJOGqnOnnZDKDV0IBwUtJRAtmupQBnkj4ZTj
         O/ONoXsZAbZfGG0QR5Z/QEfemIeCuVi8w8Hww4zcDVThY0nEIqp+1QeRQp6RZSZh+HeU
         dGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767590884; x=1768195684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4dNBCT4sYshhcHImMCTGHTwVb8+DmX7sQE4UWI3VOI=;
        b=hPoRnSKJm/M+SIM5DteBuTGBRSoQPktPf7M7w+0rqTOPInV6kJ0oXAdE6kbxdYXVhf
         9UhthAuJ0OEodLlRnDMSEgJOERBmn9t5YVQn5ZoMNYO/Z5HkcUhw1/0yK/uEYnU/9DsC
         zhD9Kh6XKZLAORqaxSN3vflKqMFkXsVFbtq1OqztW7z8reUQVZc+i0kWcr7rIb1VW3jw
         NInhVIIfHk6SWhP8g/+qYo1KZwRr1q/Deo4+9YTFIORv4WLHqI0u1j5+uh3HSTL1426F
         NvPsNKA2ooF9u5+AvApfiMPEwCzuqaQK5vGPUeDW0F06t1af8uE1yf5UQSioBw2ou9B7
         en6A==
X-Forwarded-Encrypted: i=1; AJvYcCWgEpWcxmfdzk+TAr2oFIwZUnKjk8CfigUK3k8PpBxLh6kaqfkER1U76rt5TvY39eLBXgABaQxg7kVf@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGqBGaI2n7fJ22Lc0JOqOIAKDSWFtCTt+pYYO7aS5BA07A/z6
	Z1J5YggGZcd3qxfYspUmEcsSzM2hwvA6A+1m5aLL7d5I/xXJURF3cv2DDupYadnRSz6b+AIERFF
	khqKiDTXVvg62T4jKLLIB18JXNGgomVNtnXh9VV6en61c33pq2ZmFsPYnoMHz0xy1
X-Gm-Gg: AY/fxX6JAImWWZmWn9TwfY8RY6EEbLrEn2eJPymSlBArGaZiFSVhX45BgiO6toxgr1s
	b8BSxGvI22TvEH077pS+MeK61wuWNyGCC7x4Q0ZyijtzvHABzpOvXQcs50/xMN04MGYVLZXsTVC
	EbmN3oydAiU6WBUXVuI7Cmxf8O6SzvyB4YBAhiW/3+8hT9SDYIqTJhBISYsFWdfrVTa9QVuvhk8
	lLLFxVqj52PtPuVnr2qXZfaNc+Fu5qUqX8u6gSLEylWuKl6mpikJIvaDqWLVNmPRx+Rm6PKXz5V
	gL9FDgWh6OQulSRiDlAdNgP/SOIodQgOYB+2mZp43TaZn2pUmFXXNXWRyXJgx4FLd8Y+hN9vAwa
	hA1RMUzeFzUJV6XmbFMpUyqNvJg==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr495236505ad.19.1767590883585;
        Sun, 04 Jan 2026 21:28:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbaj1V4nEbmUqRyqdLbR30phiMUr/qZ9BnYe5LDcyPtLXwba5LyrTHI4MJa9Hfds7VAJx5vA==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr495236285ad.19.1767590883086;
        Sun, 04 Jan 2026 21:28:03 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c828e6sm433017955ad.24.2026.01.04.21.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:28:02 -0800 (PST)
Date: Mon, 5 Jan 2026 10:57:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ath10k List <ath10k@lists.infradead.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mhi tree with the ath-next tree
Message-ID: <yvsigdjgbc5wxm7bcbppavepib7qfcuc3mua66raacs2gka3l7@r2vfpa2zwxv3>
References: <20260105154243.7cd5d049@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105154243.7cd5d049@canb.auug.org.au>
X-Proofpoint-ORIG-GUID: _MupKBxmM9fPG07TQHmgQ0Fta1uZt-Tr
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=695b4be4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=rOUgymgbAAAA:8 a=656955H9C4BmhTxc2UEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: _MupKBxmM9fPG07TQHmgQ0Fta1uZt-Tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0NyBTYWx0ZWRfX49A2otTtBlcD
 Jsc9k4JHXkE0upyaMz/zxwctU+AEtZEKyEZHXUejahAcDDPzB08kNJkOkTvaSyXiBs2REU2p+70
 CnIu/Ee8mTKQHJZXBNbevpwoUvZ0LUimJ192eKRFAYEOxHNAsLCT305hUd0GoBbfK6RIvVxh1Yc
 coqITs3TEeAw/Jtiyq+Ac4TxZDVzF8LFhM+tKE/cDs6S8BWFGrSjNqTSh9rO4/QzxcZDUprPXfx
 Dpr7xUOS6HiN5DoQVVVbHK4eZEkjodd4A0H3HcEU77kxd0VoAbHKRHCxgS0BaH1I18Dc5Fg3rW4
 Zb8PdoncF/L8EcojdBc+7vjlFYIB4dv9+zcqwEuyA7VVXplT2sor+l4lPqr3LkxYXp18UYhGpNH
 TEHSh9WNA0aEr54rv0CxAmq+DNeqX8Oex99xhnq3RcBQnvYAO6EJLflVfbiWmCqYdpGdgc9ijbL
 OBbJG+HXQZWxQZpzNTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050047

On Mon, Jan 05, 2026 at 03:42:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mhi tree got a conflict in:
> 
>   drivers/net/wireless/ath/ath12k/mhi.c
> 
> between commits:
> 
>   7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file")
>   a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components")
>   bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")
> 
> from the ath-next tree and commit:
> 
>   51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels")
> 
> from the mhi tree.
> 
> I fixed it up (I used the former version of this file and then
> applied the following merge resolution patch) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Thanks for providing the resolution. It looks good to me. I'll mention this to
Greg while sending the MHI PR and I hope Jeff also does the same in his ath PR
as well so that the conflict resolution is well noted.

- Mani

> From 667166ff448d06ed3ef9671bf6c8fe7337b71b0a Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 5 Jan 2026 15:39:19 +1100
> Subject: [PATCH] fix up for "net: qrtr: Drop the MHI auto_queue feature for
>  IPCR DL channels"
> 
> interacting with commits
> 
>   7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file"
> )
>   a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specifi
> c components")
>   bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")
> 
> from the ath-next tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> index b8d972659314..988affafcfd1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> @@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  
> @@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  
> -- 
> 2.52.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
மணிவண்ணன் சதாசிவம்

