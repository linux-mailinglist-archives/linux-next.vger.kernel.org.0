Return-Path: <linux-next+bounces-6913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CCEAC1FE6
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 11:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFBCD1BC6922
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 09:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A06F224240;
	Fri, 23 May 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REVszHPd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF713DDAE;
	Fri, 23 May 2025 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993350; cv=none; b=BG+GTXl60ewJR9N6bz9gLxbchrzePuH2MlQLzhTbMIw2aom7+stZaov64e/LC5/3fm95P/MLiwVg/JjEgIpwMvIa64OWOJrCvyVBjillYf87X1JI5fdO6YdBNje+9H8J+4s84Lv2RT7PnOJT/jxDQ5HCQT8YQi9054Ml+e3AHJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993350; c=relaxed/simple;
	bh=8wxiYfh5QB0RfARwtnrzlWF3MPwnl3Vjp/wp9dN7dAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzzKmMEup741t6hgyfqZzxr6SO5bbu9Johx9mkGeoJLKISHsAGhbLknr4io2RSqb2i7CgaNPwkdq+BbrGlqGThXqacUjnEdIm+JzRVfj2pdQpI+YT65IRsq/DHU7lDZqoeN3ZAGPhGBIIXEB4IrLzNr/Ov6sdSn/eSKrIVQBo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REVszHPd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-232219cc6d0so3835695ad.0;
        Fri, 23 May 2025 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993348; x=1748598148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK0CiNGbe4tQB/YUag3Cfjhb0psaay2pWX7Mwi5qqD0=;
        b=REVszHPddwTiWX2WhSYtb5kZszXEBlfiXh5zTcjEe5AQaX/tV3G8lRQ/ZDAoFcCFdZ
         jXChSn2oSzJJEaP6SfCX5HvKACTzgUza9uU4tYaZlSysAJtRvVT241LUfsqw+H05aPYO
         BRXWRBScxne2HqRj169v0ih0nTuV/sHuGQExxcg2iEyA8IRqfWqf8KtyMQvNRyuoGNnv
         sc/Cv5Vs61G3Igc32nJhncI38N9LwrZtStoKVg5x5hhA0V1FvtmGdftDllnFsdwc5oLd
         Aj8qozPugKc0tHu1bY+W1Sr9ZuPeWd3lSfZTraUVQkqVny9wEHUSqIvbo0aQTNo7GZst
         R+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993348; x=1748598148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HK0CiNGbe4tQB/YUag3Cfjhb0psaay2pWX7Mwi5qqD0=;
        b=WS5yYHpJzZPS3x5Fk1865O3Fit3aZz+OvLjK6QxxyRwqtUUBI0r8H+RIhHx4LmBl2k
         23Getpy5Pg9W/fm70B1HqreX2nPiomKEKiIa6tYUPVmU+oD55rm3Ak8c7ZdWp7YXmNG7
         v/B1Sf0yRN77HEt9BO4z+7/tHkt1fM3it1iLqlHZ4Cbrk3HF88UVj8tdZMBwp6vKPitW
         dJmfNvFHaUycjWzr6DhxWFC9fO/45MoFKmSz/jKR3NGhqOebb09+GXssow3pPMZwCENR
         ByU8mFYF+nibyWCzQkNpWf8PGc8Xxo3JNqOwxiOqa21NWdT9mriTgIn1L4LW4WUz2/rn
         O4rA==
X-Forwarded-Encrypted: i=1; AJvYcCVYoUS67WNgF7kpFUfFs4AkXe+19PHythgbHN2GnJYv0AGdhKi+gWZRk59u6Yewud5hJWc17q+7mos6KbA=@vger.kernel.org, AJvYcCXSU4muKCO8vXIQCHbnDtiCvfT4DvYjuAkwnGtbFfqOesjLX0yaiSeqzfYaMf6Ov3EoXiGTd7gbOHDScA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWOVSQUIVSOEPLM/HjwB1m1xx2Xo4/hIhQSSpxS9EWTsHwb1U
	bL8A7WK3nPAZY7dpz2Mo9HoDjr9Xxdr3NwICcBi81PDLMsZKglza1Z5zX6n3bNDv9RaSKu2zIfz
	FENeeqGdx4Tms2YDWdaBDIwNraG+8xnzbHIWFxKk=
X-Gm-Gg: ASbGncuBGps/zu6HYVPVzPz7hRlg9XEU+Lrdh6xAgqdvJudJ7BxfTPcu57puShRodAs
	FC7GeEQQ9Em0x8LINXHs2ASNgvP4a2Orpij0nEbYlmOWdU9p5opXWhHf6m6C5s/mo7I+iLDze6N
	oQye/DVQsNB0sbjhVuWuiT1gzCa4RA9F/0
X-Google-Smtp-Source: AGHT+IGO0yCOMcJAsPXBlBqllRltZ575Tz4WekDhEBbY1B3mFrEWYfkdP1yGrauAEoLLSd7NLtqTR6egackysN8iOT0=
X-Received: by 2002:a17:903:2a88:b0:215:b75f:a1d8 with SMTP id
 d9443c01a7336-233f3658013mr10562325ad.2.1747993348121; Fri, 23 May 2025
 02:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523162049.7cee0ca8@canb.auug.org.au>
In-Reply-To: <20250523162049.7cee0ca8@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 11:42:15 +0200
X-Gm-Features: AX0GCFsQZH_c60Bf01HmxGot4JtJOlWHxJCjaNXbzXYz4pcRBK71z_uM3xeHNyo
Message-ID: <CANiq72kfGWQ_CdJ21UPsGsNSfo1tgUXgNR2ur5QiA6-8WJ3nAQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	Anisse Astier <anisse@astier.eu>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 8:20=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks OK to me, thanks!

Cheers,
Miguel

