Return-Path: <linux-next+bounces-9679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7BD2E011
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 09:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34375300B8B6
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F002D5950;
	Fri, 16 Jan 2026 08:27:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8645283FD4
	for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552053; cv=none; b=L4e9kLMqu3Hhz48uxy+MIAkOkHfCZNbRCk/pfRAJGk6nCcT/Xj/Q0Hde7LqL/WjN9qWRq3YsS7bpcUtYfIoP9+HOpSGos82tLU9P7N4K3TxVsC4gHg1+iye7xli4R//jstNiBtVoqcvJH74cbvMmKdLmvWTq0k8d2ZDT4TSE6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552053; c=relaxed/simple;
	bh=vtNCPGLNvbeVRcwHoD2tEvUja9m85JqpHE8pw3cxN+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzmO8lLSYvl2cFP9jBsbr/tun2Yems+amF9aH2mkHz9e4uLYPdZiyEvkSagXtEJhMasMWs+R6HlAQS3FDPIQJPoICRBVfmSIP6xI7AvNz6XyzXUxXkiLBeIYjQiUa3BW0wI9pudkoKrteuHl0bAfoIXlbo1kvoR1JSdBRgGxrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-563497c549cso1232435e0c.3
        for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 00:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552051; x=1769156851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMM7wjmbLluild3xdDoT66+FzOjVJrjCBzishK9Qee8=;
        b=dzqCiB9pHyT6FjnQjfsQ8+BiA76valGmoSCuqeofkbElqFDR+oWvFfgKxkXtr7tUDl
         LH+yv0gbRn5sTAdwvCX0dyWDzUYTviHyFHKFa92W5bJ0U2L7YuzB4KSdlsBkv2KQ34nO
         Y4mgwAM1N1dLOLGSlpJkVsgqBPE6zcIQyiD2U62gWtwWG2/FYdMxLAUhxASQ/wqcGFAY
         vhHTtcBvh88hpzssbTIByIw8sE56HQS+F7ZmyyonSaTWJdFASkgvh4tYHeiwdC5mmmGJ
         iJudzq+pDK3AcDxRU8zDumoeStAU9p8IVm6Ipn6boUas9dEakVo8Vaxwa2xHY9f0Vrdr
         GtjA==
X-Gm-Message-State: AOJu0YwdLNbTD0fYw/M362hfHplGdMVwh5VpBuoSql0qjox+KyAGQ2XZ
	RLgXIvPLSBvGbHw+S8PyB7RI/nLfFmQnxbRnIXlHB0xTIkQyg++Rf7yjz/A/6hyF2xE=
X-Gm-Gg: AY/fxX7aH6DrFJ/dD/KULjeOEIxsMsrsAH+qQs12QIgILU4/RucDAiu+LtvkJXb9qwr
	aQr/+/s80KfCnqQTt4ZnckvZE/jPx8arcBcF9Uy+muAjJU69x1sFqDrmdlaWmON1/H7j+AIod4M
	m43Em+K+1Yf8rK2Kj7w3u0lErRe4AM7wKIw1lBpbtOeFRZml4Xa3odIbZ1qiBeI/MzvXEzdT5ul
	h8FQO2Ki2D60X8ONFciswPkngC6yJg9i6nm3cTbTofh6xAub095bwIlu+4W7g/WzSi+rNHvheaM
	Zg4kKlNlpGT/kMZtRjCfKzAB1VsZVcA3e3dbgHaW5D1FZfDqq7Gkx82javouCYoiTzbtmtDMP1T
	nnVEd8g0kgWoAJa6P1dblDScBkcrSzZvLOvVUM0Q2jSVvu54gDX3A6FrcOCXVirXYVJaIO+gSBt
	I3tET9BND/9Bt+QiTazepDP66D0o+EDZimrSlDMod0KPlDi+OI
X-Received: by 2002:a05:6122:16a2:b0:55f:e6f5:4794 with SMTP id 71dfb90a1353d-563b5b92f03mr1054296e0c.6.1768552050752;
        Fri, 16 Jan 2026 00:27:30 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6fdb023sm491288e0c.3.2026.01.16.00.27.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:27:30 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5667f944so1218910241.2
        for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 00:27:30 -0800 (PST)
X-Received: by 2002:a05:6102:54a6:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5f1a5590b12mr837327137.31.1768552050288; Fri, 16 Jan 2026
 00:27:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115161417.5a82a41c@canb.auug.org.au>
In-Reply-To: <20260115161417.5a82a41c@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 09:27:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9CLsCpy-VqdECRHCO6KG_3H8_Lpm2teAm0ciC2hn0hg@mail.gmail.com>
X-Gm-Features: AZwV_QhFOTY-7C_uwiyn9C6cu3wydtGIhCtmVOOxYNwDNDC3E-_6eUeKfdLNqKk
Message-ID: <CAMuHMdW9CLsCpy-VqdECRHCO6KG_3H8_Lpm2teAm0ciC2hn0hg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 15
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Thu, 15 Jan 2026 at 06:14, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> News: this is my last linux-next release.  Mark should start doing
> these soon.

Thanks for your work!

I do remember the issues we continuously ran into before, and the
big impact of linux-next!

Have a good night! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

