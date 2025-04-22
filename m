Return-Path: <linux-next+bounces-6331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E451AA971CB
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 17:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0593BE333
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F3128FFE9;
	Tue, 22 Apr 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fdr3Fh44"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2528FFF9
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337563; cv=none; b=YZmYWPEyMPR9LEclZSxiXgdZ4paZcDGBbYuJw9dk5Csv9TTztnsnAl5pVy+PUveSvmhDpV6PR95M01TtnoURd+GgzIhO5YdMsukrYXrX3wNiWSJ2bUBxZTIz5L7grAXnbFUrq1/5DSCFSVlYr1RdkgiyUSkOcV9d+Thl/pERP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337563; c=relaxed/simple;
	bh=XbWAU3tmPfW6ONvjlncwRN30filr8TZlVAT1ev3Gz1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPwXEji8S8MYTciU2qnYO3wXp7mFSCQ3rclypq5Okmq5cBwbhFpD/M6wcaQ7miStUmvP16WxLdj76zwWiF5LEh2BnRYHrHf/wZNMqlfjjcaS7XAlc95hDvzMJ3IS12WkFEtHm5DN/6GHvoMsTLqNZYdQ0vcqzTJJsaGXuYVw26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fdr3Fh44; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso975137666b.0
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745337559; x=1745942359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2HIoPErxyU7XY1H5jqsCEW4/SJIZ39Qm+lQHto6QhKI=;
        b=fdr3Fh44IzC05AaNMYyg4GQQ1Y9sHvUpKgrxuwzcd/pcjZR2Mktu+9N1YJ5jPaGaPv
         Kre7S/ii+jnRUcREIuTfZEYqyHMnTS2UHXLHHS7r3N6yb+EcPCOVtv1pQh5kB+HDdm+Q
         l+PMV2yUAyM1kPzlJ82llwokTTDsnbFO++LIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337559; x=1745942359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HIoPErxyU7XY1H5jqsCEW4/SJIZ39Qm+lQHto6QhKI=;
        b=btAZfOM/VIS/AHyYgRgfkjspBITXoDWt6tfX7PslamPfQdOJ/Dxtc6yrbeq0Wii1HJ
         Nedyb48M8cELWgHbaGEDrgQAmPAv/jh7JGeNDj6QC6zOTyiViWRl/xOwgqanzzD2O5CV
         o7ewH1qYvo3NF7f0qC8ijL0D/dQ6yX/U5YLOAn/5/9hcFndJ0yyILxA9mQH6OCFCtWoB
         odqHaceY/fVRfLFWQWsWGUsJolrZT9+JXR4BGXaUewzrFAM9HxFE22F5gn7yj8ziW3P4
         lhOGcRqiKsMaae4FnMKEGo193/wvlvg63Lyy4H68y25FqpC7KHkg7eTGwgU+L7h1yrjM
         DldQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwtKXwrlBewm2ia0peTEdSoC1sW2wzNflfuQfiUVZygYMJXQlqTOAJ4FTThwDOqvRIn1FHkzMKGrcx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5WLVzim7bRYjKDgcY/1zI/CCtoh4myU1qtJWzisxyostTD47
	LpKAzwr2s/lQEvsKeQecQY3JS66k0NW1PqGe2qz8qtKb3bJLAY6hNMAI88OoV2fIT6cLVIygs+w
	e2Ps=
X-Gm-Gg: ASbGncutviNzdA5VYIWR2mm6Xbg+rhLs9cDBI8bt+jjLSuirTCtLPHG6rFBvdKwmS9z
	w3FbpdPWpFQEf1NYqpkYQSzfLSBs3fYt1I3zFAm8a5kCgm5CMpZElOSmj528D/jPdYtdVShKebV
	IsdumSEoVy5zlIqwld40cShzS2M6JrEsTjh4iwvG4Zpw1ptb7roRRDRY9plvkTt/5zMEWHMPHLG
	IolU7jVIEDwvBZvmDyOwT5XqiZZD5BpihRSC3i4xsY9l5VFxpmE7O8ASBnkq8ANQdA2TvACzig+
	cUYM8/gU6hfAZSugyWIbLP9Vcin+XEIn4zLAVVbb3jmAF4ODvU4Fmr/1tlPEtSHx+a1CbUIem0E
	MW/SMo6srS/22Gc8=
X-Google-Smtp-Source: AGHT+IG417HPt7tP52kUAfyCqYg/OvEzWk4tmnY6F8iYY4b4EyLD9r8chMDfCtkAWtQgvFhM5Do/mw==
X-Received: by 2002:a17:907:783:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-acb74e923a8mr1372734866b.61.1745337559154;
        Tue, 22 Apr 2025 08:59:19 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4260csm658124766b.41.2025.04.22.08.59.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:59:18 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac34257295dso984085766b.2
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 08:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqoAZSOV+64CA0A+uSF4Y/+v3ZkfmmcV1gWG/q4UtNGLRGRNXBQf2ym9PfBPwN85yNj2zfbkhrVt0X@vger.kernel.org
X-Received: by 2002:a17:906:a412:b0:acb:b966:3a7c with SMTP id
 a640c23a62f3a-acbb9664fbdmr360938566b.47.1745337558179; Tue, 22 Apr 2025
 08:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au>
In-Reply-To: <20250422204718.0b4e3f81@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 08:59:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
X-Gm-Features: ATxdqUFV2dt2KuulaBup-_NE8Ml_xIQNSWWwroYEWK8Kjdj7aaYMLZjZpPB2BWI
Message-ID: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 03:47, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> These builds were done with a gcc 11.1.0 cross compiler.

That sounds like there might be some issue with the cross-compiler
logic somewhere, because the Makefile logic is using the standard

    KBUILD_CFLAGS += $(call cc-option, xyzzy)

pattern.  We literally have seven other occurrences of that same logic
just in that same Makefile above it (and many more in other
makefiles).

IOW, it's *supposed* to only actually use the flag if the compiler
supports it, so having the compiler then say "I don't recognize that
option" is kind of odd. We've explicitly tested that the compiler
supports it.

Does the warning happen for all files that get built, or just some
specific ones? I wonder if we have some issue where we end up using
two different compilers (I'd assume native and cross-built), and we
use KBUILD_CFLAGS for the wrong compiler (or we use cc-option with the
wrong compiler, but I'd expect that to affect *everything* - that
'cc-option' thing is not some kind of unusual pattern).

It may be that the other options we check for have been around for so
long that they just don't show the issue (ie the 'cc-option' for the
other cases may also be using the wrong compiler, but then it's hidden
by the fact that both compiler versions just happen to support all the
other options anyway).

                    Linus

