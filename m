Return-Path: <linux-next+bounces-6706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E59AB4040
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 19:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600EF466AF3
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 17:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CE4281531;
	Mon, 12 May 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="N1OYMpbO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2C254879
	for <linux-next@vger.kernel.org>; Mon, 12 May 2025 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747072307; cv=none; b=B+3EILgzIP6sX9nHJbKdtVQBcWxvl28e0Al63Wn+A8uzVdHSf7Jyfh4tn0cZmmMvqoazpr2iJEZ4OuoEgaq0HJLXt0tOFrAfEJJ4O71nFdxJhN7abSmxctjt7guhcqVgNRZQ+4HCqlOdX7p2L3AcBGBo6SdukYKoyqHQxOzmkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747072307; c=relaxed/simple;
	bh=UFhys/p6c2RGg4wS+0QEdYdP90cXWmGhYAKQ2m6cO1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCPBRu+jswxZb9PJ4jA0VOnwrAuwoULrFfWwSr1P+JC3ILkHAJX79MAUpbKN+Vf6sHUPzi2pQcSLH572bBhsniTNbKH1YSC/xHZ2LJh37AQpMKjrVQbUlb2xf8KbY6EF1WC0CPdXVwpOLgURLozBMwSOsxBfn/PCVUPqT49YeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=N1OYMpbO; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e751cffbeso415590939f.0
        for <linux-next@vger.kernel.org>; Mon, 12 May 2025 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747072304; x=1747677104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWoC1lCrXHFFO6omLxp3utDb/lcuU0uLkB6bUW5NvT4=;
        b=N1OYMpbOXTxEKmDRykau74cO1qqkRsV5llG09oh5rUT2zEajWQR7WeaDyseP4AqZfX
         iCC2aCsW5jjHDSD2ELa05ViKM5vtqoktOAZR1uG6yQnMGAt6lHqfxkEaTOp7EFrVr00G
         9SyCrnMB26ZeaP/0hqj0m+XUztgh1pmygoSZYeyZU0ESJVYtDmhu/CHu6e1VrKDdOKip
         yxehjP6kQIvL5FEPzpC70D70COo116MO+mAYrw53gtRkAoX96+bLl2y1y5pdf5VW2P0z
         pP45IJpduJHLdZw3iaNYxMPCwPe7c6BgfUDcUFGgkanip9+RUyWL9DIHr9MsOEiSyEPS
         lphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072304; x=1747677104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWoC1lCrXHFFO6omLxp3utDb/lcuU0uLkB6bUW5NvT4=;
        b=BeM8hTnrpPbUje9GhHSF944gPrnRabrNVGDQI50hZ3E/mMUlpIt3YsT6dzZNMlUHtx
         mtlelKMyld5S7vgW7ySdzzK0qjMBkxKmf+Ghu1sInMv0bR8LXxbtKmDuliks14NFQspg
         Hd/MkVOcRkZIXHX+i0eH6g/QY9yxJik48sAjyU1JHhOCvec+JQVzu1jUk0BTkfG1L8yQ
         hE/NCkX19smlPm4V7DsNSY6Ir24lxxZFIczjLEzAOpS7dZ8VPchhCKjnQCWgX7/WQvv1
         6DCT97XFIScLzcRjzGO+7FUb1znO9Uv6XgAcEwfNGg/1KWLlBxyE62c8MTpt9IDWqdIG
         uuzw==
X-Forwarded-Encrypted: i=1; AJvYcCVgjjtB0AXbtD6Dc0u3yLUub/qKpcvjPiqROOXZKVsdUIhMJ8NPy1xs4dkivKyXf1DK27hH2ufm4I81@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFcK+ts2Dc7hAqLJq8i8GEwDvg6h/0EYBaDwPx4pJEMbA8QHV
	dS446r6qRTq4kaeEaJKB+269k0xMoJeBUK9hupxad8UPBD3iNKG8A33cysf2dIE=
X-Gm-Gg: ASbGncu56SBOZOV4rYfo+FK3yLKHIvw01IkflnOdd8Qs8xYT8NdCUYu8i4gC7Xtqxfa
	T0D9m3MgBcGqaaK1jEnSPmbFBjV7WEV4PCzmq7CSeV4gc87MBpCjsMk8zG4C6RcLLrlk+kmmw+K
	Iu9sgNqApy+AZxpK/prlQdh0XaESyYBHIMh3o9Ktj4bE6lBnRaydx6MFPxRXSKujT8pRwL2b48D
	qaSPpWSc2hQByeeFYFStKCKMgVVpWpUTvKeNLOoJOWzz/fhcHFu5wGv30JBjrdWNos+Ggn0l6+/
	f9Db5d524XnDxg47TfF6MYHxdXO5eiZez5vLSYYJxbYdcbIftk8w8XN25w==
X-Google-Smtp-Source: AGHT+IGtjQ1AmbAz/kSg7rEWC+9Ul+Ugu9fwzhNjoYzj2fulVV2X3adZqZ4Hz4qlO/mT6Fqqc2Q8RA==
X-Received: by 2002:a05:6602:29c6:b0:864:a1e9:f07 with SMTP id ca18e2360f4ac-867635b5801mr1799788939f.8.1747072303748;
        Mon, 12 May 2025 10:51:43 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224ddf3dsm1721417173.45.2025.05.12.10.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:51:43 -0700 (PDT)
Message-ID: <41a03848-7597-47f9-96a5-2afcd8c70751@kernel.dk>
Date: Mon, 12 May 2025 11:51:42 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250512074029.5c7c5392@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250512074029.5c7c5392@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/25 3:40 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   3bb6e35632fe ("block: only update request sector if needed")
> 
> This is commit
> 
>   db492e24f9b0 ("block: only update request sector if needed")
> 
> in Linus' tree.

Indeed, that looks like my fuck up...

-- 
Jens Axboe


