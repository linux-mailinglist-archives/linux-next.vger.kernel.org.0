Return-Path: <linux-next+bounces-4707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDBE9C18CB
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 10:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18CAA1F25B66
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42F91E0DCF;
	Fri,  8 Nov 2024 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gly8UZth"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB661E0DAC
	for <linux-next@vger.kernel.org>; Fri,  8 Nov 2024 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056941; cv=none; b=gE5xsiH8tgI3JwlZN/zjjWvHbvosBOGbHEOohlttcxeBUTq5Z4Y6fa4qUmVH6S0lkbVT2DlmXfvVRoOXAE/wCeCUqxSZ7BLrPcoUriTdMO5VkSdy+FBbzZBomE67cdXluh5///TcOHwRndXt02dL83JN+nAZZNtRAxtuRqFXGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056941; c=relaxed/simple;
	bh=laY4jmILB60Wr/uxaLiRZB/pYgNerksyLegXeZz4yUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nRFnyiJbnjtgx5PoY+athyWT4BG1S2R6N52nl1YatNCw26HUW/izbiMAwp241CnI52LvV7JysSX+hL2gYdHbfkendaoqcZHVuH6nR5SEYdYT3kK4QcAyzqEQ7zW5gAExqIvIRyFtsSFvjgn7bSFEzb+TsWCDDVy/XeV1OQyEKIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gly8UZth; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so15533325e9.3
        for <linux-next@vger.kernel.org>; Fri, 08 Nov 2024 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731056938; x=1731661738; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xb1ICVWGXTFGmatTZgXGllwwlFmHy4GJOLy05oi7CQ=;
        b=gly8UZthrjvE0RdHBWv6/nfZVoopNmV3XQOe7RKQnajzaeWtGpfVgwtcZU8b/lN+ho
         SpxnhwsPp+v3mOsAcoE101qrng9zAZL+RFolqP9B8Bh/d3B6bDqh6uXvkondcpWNZg/I
         gkhy8J5L3EMxqphXGYOSvd72Fb0LtPAXIM3hzNXGV++Scdf/Vodu3iaX4KBNNlOvF6Ma
         h28NW87vNOZZGu60x0mURqshMRepj53xZy0SB/QHznU7PliPywH4jP+9usWHC2M9Y3Bq
         MayC0I+BZ9mgqWj7X9+6jsmikxJoahllti0uUWTUfLKjxweY6EeUPYgp2Mqtp/NWhGrx
         23kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056938; x=1731661738;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xb1ICVWGXTFGmatTZgXGllwwlFmHy4GJOLy05oi7CQ=;
        b=VTxd2cbMvvSjdv9tNfto/nTnV/IS3pUJ4gyITe9/OuuyLULUUtVRcQtPUgfJjEOTuq
         +Cre5AM7FdnQAuyJVDVNBjo/nJCJJwnYx6dZwX4BnFeFyh5Cnusz/aO/bO+nYj9OcQkg
         fQ8oov0Ap5XjSNU0LdKUZig/LsoI1ljXFtO0368wDZkSfG286mXp/GwwT7nhvBTqHgJO
         aHGbafiXy8V0dp7beVv+eY8dIrafpzlnsBlRcNpXiCvYOeUtzc32pQrtmdWjHJA/UrmB
         4UIYjRNTm2n59Z0mj/A3dy/jq+6TOYmriirhdp2LRTwCdtjMcdb5XxJ0OTHm3eY+Cyoc
         KngA==
X-Forwarded-Encrypted: i=1; AJvYcCU0UgPuq3Tr0AOkCr2YdCgxKPQyAUjANIkCt2yNSLU+xrt7yN/lljYOEQg9xju21/plNrjMmciaUuFi@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmytRjbxNn5LYyetgMoWdYIzgbCqvbyFpDPSfRIBZcKw7mYQE
	3ZVkcmUhzAT8F94Tf/O4hbK1JnBf9s5QP6WfDzgExh2MsMkUC8n6lH5JaiXVvZQ=
X-Google-Smtp-Source: AGHT+IGc7WSbgcJgemjnmfyYnFD0FFxFhnTDoVt/WUlBEoBVWkIM08bwENgbaktsObOHDzFoXT7w6Q==
X-Received: by 2002:a5d:598b:0:b0:374:c84d:1cfe with SMTP id ffacd0b85a97d-381f182e898mr1747898f8f.21.1731056937952;
        Fri, 08 Nov 2024 01:08:57 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04049sm3948176f8f.93.2024.11.08.01.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:08:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Boyd <sboyd@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
In-Reply-To: <20241108080914.65a7a03a@canb.auug.org.au> (Stephen Rothwell's
	message of "Fri, 8 Nov 2024 08:09:14 +1100")
References: <20241108080914.65a7a03a@canb.auug.org.au>
Date: Fri, 08 Nov 2024 10:08:56 +0100
Message-ID: <1jh68i2itz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 08 Nov 2024 at 08:09, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>
> In commit
>
>   5e052ef3c400 ("clk: meson: s4: pll: fix frac maximum value for hifi_pll")
>
> Fixes tag
>
>   Fixes: 80344f4c1a1e ("clk: meson: s4: pll: hifi_pll support fractional multiplier")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: eb61a1264990 ("clk: meson: s4: pll: hifi_pll support fractional multiplier")

Indeed, I missed this. Thanks for pointing it out Stephen.

Stephen (Boyd), how do you want to handle this ? The commit will need
amending and it's something you've already pulled unfortunately. I'm
happy to redo amlogic clock update tag, if that's easier for you.

Stephen (Rothwell), I suppose (and hope) you are not checking all those
commit tags manually. Is there something available somewhere I should have
added to my routine checks for this type mistake ? A checkpatch.pl flag
I missed maybe ?

-- 
Jerome

