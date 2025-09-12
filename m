Return-Path: <linux-next+bounces-8285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FEB5445E
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84A31BC2B5F
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 08:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F20F2E401;
	Fri, 12 Sep 2025 08:03:46 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FD279DB7
	for <linux-next@vger.kernel.org>; Fri, 12 Sep 2025 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664226; cv=none; b=gIlCYsD3d81/slW/hZmn5AzTFLGX3n84++E/hGzKYiIqvTpxp+ZVOz2SkU+vCoGwupRkZt/FkwAqjG70ap2AdCSOKsHaTdNnpYc+3EUwOeN/7W4LXqEl2oZePl00jFfUzH+YHfz/rWVqM1gfDA7fxt6STEhdq4AcypD6yp75Sy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664226; c=relaxed/simple;
	bh=0dBio94seEy8E+hLMM0zWH0ran1cHBhU/hLk3oSudx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFhodAeV05WIA1MhUSny3m3HNS/1Kuvzi7VzpLR6/pL6qpyfNwzRsy03INLNRrcPtrMpQwqt1gereb1f0qS9H92F62PEPXznE7ppF0ioGqK4oyIIcIglyWDW0TAjiuLLYay+l3bgN3NEiS31P3xJqmaXHdtr3Fh9ZUwODzS/6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5299769c79cso1206078137.3
        for <linux-next@vger.kernel.org>; Fri, 12 Sep 2025 01:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757664223; x=1758269023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0kOd0FgIbQeQ+Oe+2cPl++UuME9YSWct0/1BA9cC0g=;
        b=b6Lhl9ec/7d92epk9SlBiqhebGLUX5KpUxl6YzigxRf959+7yiHaBKdTwQM/cwnbS7
         8A2qG/yAxyEkfystco6BsGbkixgU2v0Foo7XJCcwCmIXljxyodyIKvCL/qJAn3f48UOR
         MR53HELuIADPiYm20MQK9exBhYzLecWdV70bOYHCXhBei1Zg+sijsQ1bTbZpvDzF65Fi
         S/pR7vyl4j1EfWc6fsbYab1a/mzBygAro9C5NMSBm3eA89+sWjjm4A1tpZkH5Nt5WVN/
         utmxbouY+/ujkP/jz+K3e7DY+OnpsMMv3aeAAnFKMsCp5JcbnrXk2Nw/lEBocm8Qskxf
         YJJA==
X-Forwarded-Encrypted: i=1; AJvYcCU26+png09F3UGYizE3itqre6GGZm2OO5G/fHSTMd/jqHAXkDAdx3pQyklZIzcHEeRIUUf39Qh7i6un@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QLFhx6tl+hr0felqJkb5u88fyBKemzEbgRm0IbEtHRLFS956
	4EENhBQFNcPVSIF7MvtTsrcVgtxee6EEMObQjXQ9TU/ZXdHh40ij2J+zx97tgDOe
X-Gm-Gg: ASbGncu6cJUraWitlXN4ZVjCLXD8zkDzlKw4vrTEUVUQdA9buZ0o0q/744kXqQ9ic0D
	QNu3EFbLG7s+cuFQ9zK4n8YUAoaPACcASBh9nTdoLWfjLW9BgKGlqAYS9O4wjOrs3Q44+z6RskK
	GZIlNvJIkc9PLgJpbeenkE99//VDvIT2FdqLxn24jn8onj6YjBRc9QQKmJZkWTMxJQVx8Mw60EV
	/ztojrkf4Gjq/lrz/Lh4O+Samo7Mmi/2okZC5QrmyKpvauGNjE65pw+PNXPzbkPb9IJpMLH/iLQ
	8XqQwTTBwGAcwcOyy0ZCrNjN2cKaDjBTWSAcgKMp1xG8La4wwzbfg1mbllsIje8k09LC5Nc56GN
	e0DTrb+D8d0Dl2tdkKXmAUwpMIGBYl1heN/7f4YfbnoEjdB+dxaoZRZHInWqN
X-Google-Smtp-Source: AGHT+IE7cNFjyfbtiTi3upiIAHpJvNan+s0CyumvXty+BmGTwBWdnaPJPyTMVMSvN9UE7pibuh3K2w==
X-Received: by 2002:a05:6102:3a09:b0:525:3802:c260 with SMTP id ada2fe7eead31-55608e9e69cmr1012145137.3.1757664223322;
        Fri, 12 Sep 2025 01:03:43 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccb99b1a9asm710944241.0.2025.09.12.01.03.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:03:42 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5299769c79cso1206053137.3
        for <linux-next@vger.kernel.org>; Fri, 12 Sep 2025 01:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvlF5NLam8YUv5JMU2VynjdAQsM8jLCPqrkE7fm54tVbKyjoPpPo/eVvWy2yg+xrRYXzjS3N8ilfbO@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:520:ca2b:4591 with SMTP id
 ada2fe7eead31-5560e9c8601mr948772137.20.1757664222098; Fri, 12 Sep 2025
 01:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912083052.399e505e@canb.auug.org.au>
In-Reply-To: <20250912083052.399e505e@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Sep 2025 10:03:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-ceznusoe7zi2bC_3Drx8Z3Dq-UhR8MSp1EAVEUTdGg@mail.gmail.com>
X-Gm-Features: AS18NWBf-eGvN2_4q-VIfWI8lFt2xO03NXlmDvhzO_CyVq3WKsOEqbZM-9Q5UPI
Message-ID: <CAMuHMdX-ceznusoe7zi2bC_3Drx8Z3Dq-UhR8MSp1EAVEUTdGg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk-renesas tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yuan CHen <chenyuan@kylinos.cn>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Fri, 12 Sept 2025 at 00:31, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit
>
>   380c74a29937 ("clk: renesas: cpg-mssr: Fix memory leak in cpg_mssr_reserved_init()")
>
> Fixes tag
>
>   Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Thanks, I saw the warning, but (incorrectly) thought I still had the
"increase to 16 digits"-patch in my local tree, and miscounted the
digits :-(

Fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

