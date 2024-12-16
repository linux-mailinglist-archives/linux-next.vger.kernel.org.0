Return-Path: <linux-next+bounces-4972-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F29F3952
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 19:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E417C7A397D
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 18:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACA9207657;
	Mon, 16 Dec 2024 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2Ce5JH7n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBC20766A
	for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375201; cv=none; b=ON9gdGl+KwalLU+nq2SVg1ZtzayDe158UyipktAPbQl8At+3PRyUfbKO21GLgIO1nCFPPL1H1DFw4EV87ClP3kyTpfYVJt5/nbDfFaEO133aEU39wj2N+IP/5uFk3/qYbpg/5NrfI2rGKK2c9paqv9zcI78/OMRB+z7vtEhZpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375201; c=relaxed/simple;
	bh=QksVs/Fxv+cbTfWNhYVGoeCzkAB7AdKcWXZuz26F64A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Br6IJ6wYrr4NcinCsy66lItgEaJTzwVl25MkKV6GoLTdXrfnWI2YX9fZuq6ThZ4pS0Y940kCOBZIVEVlBb5Uz8F22Pdu6Ye8OsnQ/eAwy+jZX6tszFBMSRQ0gCkV4g9f2kPVJJjxEdPiX1uOotB9p+8uRnGc6rVXbKlXJCIifBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2Ce5JH7n; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-728e3826211so3509090b3a.0
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 10:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734375197; x=1734979997; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5LtCDUPpXP7mZ+NtBMUfwJXGAbOMvjyVT6yZDJ43guI=;
        b=2Ce5JH7nlAQiKQgSJNQp9hOiMBlUa0ogI1g9soqcTageJolocav3FMJclMjYo80/Xy
         50Vdt282wcQ/vqneHQ2eEtwUKddVZJINPmQSCHnhf5tVXw8EnwvVyOCSXWUACVoSgKfT
         wSkDXWIb7EbLV7YMbMZIok9pbMWPB/zwoCFZCjqsOGWa2A8xeyCINdk26B+iRdglhvq1
         efhAJdnqoZlj8mFqA8oDoTEBujTbMrSlf9zz7Eov/hvAkV60HFxIyzg5FmAbPT5xpxgf
         83TmlXKBsXnorJBeG/ySZZsbbXqggP6OU+fNKGc9hGVmB5Z9NVzrXsHXORa5X9P0My4O
         09ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375197; x=1734979997;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LtCDUPpXP7mZ+NtBMUfwJXGAbOMvjyVT6yZDJ43guI=;
        b=KUE/Et6m/Fivipq5YYtyIWltm8GiwX5tJmzIQ4X/G0DEMldDYVKF5awSOacu5CUg6F
         q6iItbY7mlxBRfX+ByHNaiaHN9phyjZvfwnXsm5XPqfYFpZg6RITrwELtSohhsO0JZ7C
         7uLrNdA1/TLc7tqwJhYMb+YLOtybp83fjxL2gpcLbsNv+fiMMipwphk8fspxlzXQMvkZ
         +OGSbvM3H85zMx/seGBukSPVjNd+BkngFkzXBG9NwIA50+Cth1Bl+1O9SCoVnjSQ7a0e
         IzzrNW0dtrP66DZAfpbFFDbKmgI3h5RFbvEaC4UefvHLWDLnyaX1Wy3ZQ1nQlQLFgIAA
         pw9g==
X-Forwarded-Encrypted: i=1; AJvYcCXfGESIBADVEpSMp1LjxGjLqDW4XDc/GXpZVJLjl3/qoDjLr2oeeVi7sAyfNsnDEQva2MoLbXWd+/rP@vger.kernel.org
X-Gm-Message-State: AOJu0YyiqeyyorisP2qic1/0dfPcvBhg84ZB5WXVAEHVx9dKqNA4rYNJ
	H+9Ff1OeBSMVAFXr6RCShhboNP1phWeBM91f5WWPYu99lG0Tx15eVNhTlAjpM2w=
X-Gm-Gg: ASbGncsW1lggMQb4YIYS1dEQZemTC91iUoiMufqSi9QuZ/6QfEwxbFGsH34bCy4BR0K
	OY4k9l6VzadZmXnqogLrMD7TEukG1C+5XQVO/VTrtULMvCSRCKRteERZEikx1m31onrngv/QEJ2
	mnjwbYzvI+wvZiDpgLjSnj9CiTybZjqXV0dCV28W1dPgCBAYCE59DmYSgguCJ5++R+GHaExjzyE
	XACXzkgInQn/+55Ha1+QeK3ff2qSXNDODG6bw6XzzihvgCJ+kQ2ACw=
X-Google-Smtp-Source: AGHT+IG7ou0OLntrolix78mJXcOLuespNWbeAilFeGSN0T/emum0szk7WfV9OyOyRpYPPEVP2Vk4Lw==
X-Received: by 2002:a05:6a20:918b:b0:1e1:9fef:e969 with SMTP id adf61e73a8af0-1e45ab18122mr1137519637.4.1734375197464;
        Mon, 16 Dec 2024 10:53:17 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c0ef86sm4435890a12.56.2024.12.16.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:53:17 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the omap tree
In-Reply-To: <20241216113416.3e78369f@canb.auug.org.au>
References: <20241216113416.3e78369f@canb.auug.org.au>
Date: Mon, 16 Dec 2024 10:53:16 -0800
Message-ID: <7ha5cvcvdv.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The following commit is also in the drivers-memory tree as a different
> commit (but the same patch):
>
>   56d96fc55390 ("memory: omap-gpmc: deadcode a pair of functions")
>
> This is commit
>
>   5119e6b44f8a ("memory: omap-gpmc: deadcode a pair of functions")
>
> in the drivers-memory tree.

Yes, this one was my fault.  It's now dropped from the omap tree.

Kevin

