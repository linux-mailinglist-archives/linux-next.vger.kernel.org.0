Return-Path: <linux-next+bounces-6526-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B35AA942F
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 15:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D3EC170DCD
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E032586D5;
	Mon,  5 May 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eaAdMAuk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBD2580E7
	for <linux-next@vger.kernel.org>; Mon,  5 May 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450923; cv=none; b=V4mWo2sFcSvSfIDyEaLA0wHXSXFOyQqjcpqqVhMZ/DeLwmlK4nRJKkrGFwwx79o3UQ5CSKhMTgA5HVj0wK0JWPl+v/K4gW6CWGQs7J1AAHdtpV6XxE0KG1hkc7SOXCe7B6czkSykUGs2Ije+ZBQHNisQmXxtMgOeRfEfsH3C78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450923; c=relaxed/simple;
	bh=lQrkN+4oEXoabNebRbEs2m8OZGZ5XRso7DP90cD3zRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPcUSWmAyMymDMxOYRBm1bcyIPxxhL+QONQl4CN4InR9/tmXwFdYC3BzlZOGtYw1yW5kFukxXwlTNg+/ToJfqdaALdi09aup6d0VU6kMw29XBwc8kekamXMXyPB6bxdZvCV2e/C9pcRWJnTzMCzqPeDEFmc+5ggNyJo8Bb8RsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eaAdMAuk; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d450154245so37970715ab.2
        for <linux-next@vger.kernel.org>; Mon, 05 May 2025 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746450919; x=1747055719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JC2mo3/LlPLofco9In8VXGkCzE2KGJMSgE1KU9GTJew=;
        b=eaAdMAukShiqAA5d5+7pxX60uM515QJVM72l/9XEmvUyYs2yE/ARsc/y5d6ddmPF/k
         +oKJIOyFKsu5Km3uJyNybDmTj4HSOiCG18OgHlIIqdgBnw9lg5iMbpFV3adHpQjWoV3f
         hsZ50xtDu6M20dUV8J+uZbQjK7mNwGOpc8AgcssUi4BwIFGpJfPbhMGW/YzLEHsCPD5X
         yR7pWnDZliWKbXKi0l/Sxa9Rph2O9FSdbePRIW9aoFRUPclrQq+aOnl4J9eAvBgPfW7m
         Zhy5cJTGunlVIr3OxEGEs4zPdVEKzt/8hhpk8Pzs/gy2kiD/TmhRostWVTAuUuFIrMpr
         0Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450919; x=1747055719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC2mo3/LlPLofco9In8VXGkCzE2KGJMSgE1KU9GTJew=;
        b=jyDjX1lEs3SBoVv51W9Eo2UK67nY7lGjhimTTxd/1GAFKUDw9PPS+I54R2sEAQ3eZx
         Zk3ebnW2uBG7xKoHmaSEn3XAd1HVd5Dz9VIFButABA6kEWRSf/P3I3QQ38X1IEBEuViE
         Y8IzI30LEH/0CG+QBV+wq3lwZnYlEOFHd26hcvEaFyuE0lAaYVKKmGbpan3xhRB4ZAK7
         gKU2/7SqT6yI2Ol3wqEyhy/GAjOLvvssLpyPb2PUdW/8o38vy5C0qsJqAn2xD4hC8A2r
         mhxdPWiDb1DI9Me8yCiUlMQAvuYg491k9j3w34l7jyOZFemJOTyMa8UyVVbJf/9L8xux
         34dA==
X-Forwarded-Encrypted: i=1; AJvYcCVd9qA7X+VOHN7vyarM3uws9DgeAWl3rjv6SZ1g/Tj3Yx+TAxt1F9+TrFyn2wci7h/BgkC6TBzhyOHj@vger.kernel.org
X-Gm-Message-State: AOJu0YxJL6kcrIv6/riDOkGgc/N3t28Y2UB1UkTI7Pr1OzfqddbEuDWg
	H70ItQ0IqFwFuDZYjFD5FDX6D9GXt0Qbn/1tCWQdA/H2OrYY/p90vbhEW3+CVePQDd3T9F6Gj8L
	Q
X-Gm-Gg: ASbGnctMFWa3iTJPFmcHjNSUt1sgRLb6Tc9Mvcwxeg6TLlHQK5ZU5wAHWZWsUswxwlN
	6SvhryhaH4qDjpOf5X40YWavMphkDwyaa4u5ZHIhtCDO51d2kgnzgV4pAmP7ZHlMg+25tVQT0v/
	uH79ZNFheqWoKTWqVVDdD0TsB6v7qxrp0EeWdukDI0QF0NaksxxI3MY/86Qbdiej/E4ir/PQ3gl
	YXeUy1WGndFXuKAmEADrPDnnTUGDfS+uPMYo3kOumAUSmpXKxoCFbjUKHEEBpuPIBmJSWZc/cFI
	TMy7V9QU3WfdbpCyLvZK0vuFpdV0pk7JKCFuPg==
X-Google-Smtp-Source: AGHT+IFK4worD8fkVatd6ju3w0j+bUR8Z8yoarIsuUbwXVcwuUJnPu+7pcRFlTT3Bz4wpsAhzX8SLQ==
X-Received: by 2002:a05:6e02:2510:b0:3d9:6cd9:5079 with SMTP id e9e14a558f8ab-3da5b31d935mr65744215ab.14.1746450919401;
        Mon, 05 May 2025 06:15:19 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58be3sm20308835ab.58.2025.05.05.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:15:18 -0700 (PDT)
Message-ID: <daba7244-ab22-460d-9b7f-7453b5c4670f@kernel.dk>
Date: Mon, 5 May 2025 07:15:18 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>
References: <20250505132520.0a33799d@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250505132520.0a33799d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 9:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/block/ublk_drv.c
> 
> between commit:
> 
>   69edf98be844 ("ublk: decouple zero copy from user copy")
> 
> from Linus' tree and commit:
> 
>   2a86eec6396f ("ublk: take const ubq pointer in ublk_get_iod()")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks looks good, I've merged the 6.15 block changes into
for-6.16/block to resolve this locally. Current block for-next branch
should merge cleanly.

-- 
Jens Axboe

