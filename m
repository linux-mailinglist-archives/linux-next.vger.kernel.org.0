Return-Path: <linux-next+bounces-5795-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD663A60F89
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 12:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6049D172C20
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72E01F4175;
	Fri, 14 Mar 2025 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fdvc4SYc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F571DFD8B
	for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950250; cv=none; b=V+S1661uEGyQEKeg6z4eLKt+Xevpli9liEkFYei8TjwOaCEwtsA9TvPfhje/qpVzCxfjkB/6Mbh+1dqu8A7sO3NZKTscKVJOANjSjPMhaaEQp8os6oUhu9tk0L9+7sT1O2VHCyv7epzIUvTTePtjnXq30T0xLZhErZmhnuc1txc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950250; c=relaxed/simple;
	bh=T1mrmvRDse09XjyEGMyC8lC24g3f6nvYSCJy1Xo3NzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnxIVJ1/LzD/Ht6cuvDteadoJ+NJsSw5NrtYVZ10znCllQ/SSbvfXgRVugV1I4Nk3Xjv0WOx/6y5fZA+k58bb4/x4up5ia81Ha0NW8NKhpOqR0V3DFT6h3jtuwkl6UsaTYFDGhHz3n001dPsrgw8LaGZy1zsiYvKKLpZFp/MAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fdvc4SYc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497590ffbbso2007051e87.1
        for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741950247; x=1742555047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NiyiUpsfaIqtRcFq6JeHy3gqHpHk2qfaQ/0t696+60=;
        b=fdvc4SYc5OmYdtJapvhgDboASTi+sr2TzS2BO//ij3yRJDCk7XPJ9xRyAhmZ7AYuUb
         SgdeXjIlmAJhQjcdGlbcn1okNTJtLvr7W825iPP/7X/66UgiTBymdJAuvMxJoEbwbkoz
         5qJnKLJJTmG9QmDbrjpQsfgxkMRA+k9BGeA90kS25WBG0OPmfqPBbSmR3Sp7gwa5YjBB
         R2hljBvN06JD8NpMTCJ8wNVNFvJ7hgR2UTY0JQDgyl3TWyNu3w/bjChWUbYsv/LU1aVV
         mET0UkP59rWWVHIbGL15ZZ1lt5dys3P+LGL/AaFok1n/OJKfAKB/s5xdy1Fhe7i5pBEo
         cuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950247; x=1742555047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NiyiUpsfaIqtRcFq6JeHy3gqHpHk2qfaQ/0t696+60=;
        b=NjvdKI/CriY5Fa61Tw+mp38Zy9i+ymbbKh5e61YZP/0ucQp7a2EpBmNnZLhad1GgXk
         vB47FWEMsuKPEaHZMVMkXutptwYvZmn/vK39UcdKDsaNbKY4k/YQgUf88Bsp6Wchf3oZ
         /GRuIOjlT04V9TZQ9Yydpaa5M4xEpDHx25ExsND+VE5hDoYO11SyVS/K5fJljFBAYjme
         KYN2zCYNjqF2oENrXSvs7WuOFzliApWlE2xuvOg4QY84GAkMigrJZGi0rH8b12urNzoQ
         TNXZU4qrb/ogGRPZ1Uk9PrKwppXoWnztUoXnH7JbrHT9hUCDDOL5hQ1tNYDM9+M+bflz
         wI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqKK3AiT+UoHwT6B1GvKtHttwc9wIVpmbF8/OkplRD2qGSU8ck9UFkDqdKuiTIlYrobhV0r6pHwbZc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tKVxefmb3N2IgnHo9fp+mko1g/9oelJdZHqcgX7bN1HKL38x
	qH6CiczCKq8Rha/6B543HfJE38bg/wrelkbY227Nxm+WUP7eK0IAhnmfHV+kj0QAdSTJzc5ogcs
	BhscGxLXcjwKw/Oa3QIGgBgqb5Z0OT5gouEWeRA==
X-Gm-Gg: ASbGnctDSSIvtuhO6OG0Nurgv5jqGVif0HPr7lRVssQBPjnaoVJ/XbbaJtXqFPIW222
	0mZ/etZRLzWAcddUMZbeHvAMhMIii3ftLV7fQwttTdKp4Najh/RxXcn9fVk/o3IjNQdTc59fOA9
	u4aRh5HFTDitGcI9m+8mpshTc=
X-Google-Smtp-Source: AGHT+IEJEtlyxcViYWHtnHw8neApXqEn5T325rTS+M99TZiJoZFmmpxpAbqICae/vYhTB2NPQTDkXA7rbl3KdneDamw=
X-Received: by 2002:a05:6512:3f22:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-549c39002f4mr765760e87.16.1741950247028; Fri, 14 Mar 2025
 04:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314162452.2657f42b@canb.auug.org.au>
In-Reply-To: <20250314162452.2657f42b@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 12:03:54 +0100
X-Gm-Features: AQ5f1JqUCQoJNe3J9-UZ6faP1JtsfNzeXDsEj5Br4ty4YwmTnRYOXfJpS2yaT9U
Message-ID: <CACRpkdYe4P0xtrNyvwxcd9OsKPbGOnFQXMfuM4RPnJsX1o=5Vw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 6:24=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:

>   a40b63c773c2 ("Merge branch 'devel' into for-next")
>
> Each of the parents of that commit has only one definition, so something
> went wrong with the merge :-(

Yeah it's a tricky one. I dread I have to send this to Torvalds like this..=
.
I hope I fixed it now.

Yours,
Linus Walleij

