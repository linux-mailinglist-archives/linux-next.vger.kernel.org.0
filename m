Return-Path: <linux-next+bounces-7079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BBACF94F
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 23:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2686A1897A25
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 21:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8176027465B;
	Thu,  5 Jun 2025 21:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ntVGxYll"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA820B21F
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160539; cv=none; b=uQ/zgyMvnHOA0qBaJGINLC8tqk74UTn8pPIz4s2Jz+myERO41nY5I1s86l29VY7zMZY7TjjSumF3ZipQvVjRPucRAw4/TAcpDmCsQpdr/y1+NZ9MB/IR30EkPkXKTEeddUGa2oLXJcU5k2N1PwCjnb98DleCe7V71ScEiKqn0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160539; c=relaxed/simple;
	bh=lv2t+uE84kmEx74907j4rFCvGFtRtPS+kipfsQsVKas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFX+pw3CjiPh/3zhX1e5Ojv/TOxlHlf6F9Hbu/++m+DRukPviH2FZ9iWrTCMbX5iAScfctGJq8UWkxegGdZH7X1qtIROwJa180++X10mv2NuzfyFDF6/nWuW/533XujEPC0iCUIwuqXt0SgYDBaQwlPQW1xn6TbfAKG5a6FoGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ntVGxYll; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86d00ae076dso83714639f.0
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 14:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749160536; x=1749765336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1tPrRQ909k3LoqX5HXL+H8AJdVmtNVHZDBG5f3YzT+0=;
        b=ntVGxYllAWcWNoOhObCYcdiF6p8BE6bVq8cSMB9+5ZKymmBBTtMKHViIUcZDEr7Yj9
         tv2bjALdwYiOe529kCGbHGP6pqG57O1yLYRw2vm7O92vGdiodwRof5PlLLhH42HGcDYP
         rUbKOW/NWAx2UvK/pC3eKVYe7/cnmsPaugjAJFkVjbMPzAd4ih9zywSt/P72ibjExdA7
         7SjoBmkXQyz13FlvycTcyTuw3Np3GLwOxRTNkEJYwgg+fFip5j0FWyoCODA8/s3HPI1c
         ev2gcD4Y7LpS0quf+y4f/gtAFBWpYw3omnWh6357MFx+RA+INcwuX6XVXr3edBAJ88MH
         bwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749160536; x=1749765336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tPrRQ909k3LoqX5HXL+H8AJdVmtNVHZDBG5f3YzT+0=;
        b=jT2628muXb1WW+FJ8mKu9/m3OrnOmGnDTHqyUuOCAFGUG6naUYkKPDudLIJ1IjM6AW
         8Ga/wN0w6IVmBigbbp9gkZMK7HqZUlxJW83QjGEWi/hBIqwI58TX21qvalhItRgqX+fN
         DXXMnhcBtnrdJO5ArvLhpJqo+MzyvtANLc6zjVPn+GsbSnrhZfu3Iq4Rx2NGI7RvGazg
         CRvEFKzqAVnH6iKEhXXqw83MlxrfSArJoEmnXEzS29esWNW8xhvNvpPihTzADaZ5Nscc
         tuJbgiz0kNh26bKIn0EcNakrhgxAyALTrWeb9sV6NCBghIVLVmFZ2xP+26pUFIiWhdMl
         fYsw==
X-Forwarded-Encrypted: i=1; AJvYcCWIx5mkVABD4FqPSqgFQPNAFQGUzGc8loo/9NZJdF/kIJFoilDEAE9rLMvbr5+QTKAhAFboX1Y3Ysl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+KOS+cTj9nCVe7CbCszusp1rlpwrA7HXeE6UqG8bTNOnpzXyf
	l0lFxXSKn15S8haQyC2hd1Vf+/Pq1N0ipVkAj+i3IAdfCpW7B7C9GTAThlxZCJ1EGAgrvEvEDxG
	V2W/6
X-Gm-Gg: ASbGncsgd+Ns8f2LoVzpCZWzxrlLzzvTNYh4DdKHba2gMlSD6eTy2G8+8eBOcsUf1sg
	4pFj8i857kdUnKlnUaKU8jfDuBi2Av7D/THohGG2lGUNz+N1v5lOeC1oljrmapayFyFa4c33RsS
	eK1eHhJyIVfapxaz5adw6sIbnT/RGoYOPGvAy5fcAn+wX+t8sDmiHvcEXyUKNRHxY6jQIysEcg4
	kWkWEVLToB259kQuCYeT5FkNP8Roo//not6vyRLs2n20Qn3obrphrpXBd21eeJA9BnwkN6h64YI
	wUvXy8ailKGBVww5+r9f+2ofQQL0peXWRjV/ywZmMBYmQMZBxKXdfKZul1lxUAW+SKViOQ==
X-Google-Smtp-Source: AGHT+IED071g9IJXlFKyxypxNqRdATo8W0vGPD4rOVyraGxCMIc9j0kcJ2eTDLX+1hrfrxWCw8j9bQ==
X-Received: by 2002:a05:6e02:2593:b0:3dc:7b3d:6a45 with SMTP id e9e14a558f8ab-3ddce521bdfmr11754995ab.0.1749160536364;
        Thu, 05 Jun 2025 14:55:36 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf244ba5sm539375ab.38.2025.06.05.14.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 14:55:35 -0700 (PDT)
Message-ID: <ddea36e4-4e89-459d-aa60-3d3c05a9b688@kernel.dk>
Date: Thu, 5 Jun 2025 15:55:35 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250606075230.6a13c53d@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250606075230.6a13c53d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 3:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   10f4a7cd724e ("nvme: fix command limits status code")
> 
> is missing a Signed-off-by from its author.

Sigh... That came from Christoph's pull today. Keith, can you just
verbally sign off in here for that patch, at least then there's some
sort of trail publicly available.

-- 
Jens Axboe

