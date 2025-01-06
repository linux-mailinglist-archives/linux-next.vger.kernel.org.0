Return-Path: <linux-next+bounces-5057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F2A0271C
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 14:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB6261882C15
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 13:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FF1DB943;
	Mon,  6 Jan 2025 13:50:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4400182D2;
	Mon,  6 Jan 2025 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171433; cv=none; b=hR0aMUjxPSUi4l7ubnLm7d9JsvB+sHH1M4arhmm2KhppN7VDfdif8RModpE8GIz5ziW70c6F6RzqJP/bHWJdIKdI0DSRmMtH5torQdo1zMIvI7K5o2JXN6FWspXjMROm3S8Q36RgNxmwDgWV7kH1eaucNAjLQCJh0Ch3i7uSNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171433; c=relaxed/simple;
	bh=4LDeChW2Dg/2J/QS8Hk1a0ZgtbvSy8bIqOive3kp8ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKWVSDpkQ6C2Z8Itdh86O1deTZcJ13nlYASCK2Yr+uxEsNKdRzQ7tyOElc3Xd00D2ltcyJFH0g7wjhZknEbeY/QEHWt/NEnumzYxWbqDNbxt1kYQtsPSSFnxSACpR3g6OBssiav0F94UkM2myKRyrdYQXHuJ1M5IDfCvDdS2RD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdf096fc5so3080362137.2;
        Mon, 06 Jan 2025 05:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171430; x=1736776230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcEN6GlENIHsqd1mpG2vgiU19EGCDi+wUMviRlvFB20=;
        b=Wc9F59BVhqyOMcrySwd+S6T0ZD+KfNNgSueop8+MQHwwaX0bxw8sFOCLzGJFW5vHGH
         smMQaNxP50pH1HqIwJVulJU+jOaQKSvacVQOA/MS2b24ugVlTfLFclD3FPsPUffV8tsk
         NB6+bpjq5g51rldDH3PikhQMlUr8alsKcmYf1T1VTi3rZc+ywHbWauTZqQCem/VXho5+
         IU1zlttMJroP+BM0qimEDw1M39Vuc0yLB0t5a86AMuqLfc3h6H84jPZhDDSzorfT8b2S
         JuCcs2akLH6c6PzStqm4kfkB9yRQgTm7V2KJgGQl0hR5KtV02W0JWmhm/TAvQVWh4wy3
         j1rA==
X-Forwarded-Encrypted: i=1; AJvYcCV2v9vZDE0F8nmLdE1WlrqADgLy1jArt8SpJrl2EZ9Gch5dMa5Pu9BnifybN4fK7dxQ5mwBjCnocJBwn38=@vger.kernel.org, AJvYcCVs74MMVOQlGckcM8c+TihVTBBQUypOFLykq8fdfjfGcqJRHzhO/4iF1Bs7shlmx7cTawR+kkRKwEZaAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSBMGeSU/I0SJn7Fg+YZM9s3k44v1KazQ8xpkeGLPp0W9lxkg
	GHeQ9OM8EEs5VEAxL8KAW1GGwSL6NQx41VKJtlz8aTcDXBaCEBeuWjSMaAPa
X-Gm-Gg: ASbGncsQLuleYhHpOoEM4ATFIWnMCF2C1sdXSnxztk0LN9E83q5P0RcCYhGtBIyQzn5
	RZz8Ia6ekzyPxJJcEk45qj5Yn6uA6BwOmQahLdiY6j3gbxy6E3esSb6qd0jSgBj0wTq/c8GqYH9
	zRatPIuQEqvu0zUR9How3cynQ54a6pyl2qArKGJOONHo6lPxblv3hooYdSmQaQJS0eKhdcAcznL
	mXOUCCK1bAS2E4BZxWjTx9YfEgc81LTJ++CgeLNs2gW0/nntNDPhbrlcBWfvLWJCFTe/XxRJ6AF
	DLBpE5qaBAG67gF9o0M=
X-Google-Smtp-Source: AGHT+IGxmG59gSTHpX8W+BQxBjWDIyQOosh1Og97dwmk5Rh45svg7aPB2mPu9Kw3VnLfgHrEzCYUIg==
X-Received: by 2002:a05:6102:5122:b0:4af:adb2:5133 with SMTP id ada2fe7eead31-4b2cc49acdemr40378687137.23.1736171430269;
        Mon, 06 Jan 2025 05:50:30 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d09ca9sm4398251e0c.46.2025.01.06.05.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:50:30 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so3526591241.1;
        Mon, 06 Jan 2025 05:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT7itOVJsZGnjs9tn6uiu3Qc2yrhUnRxxvtSXsu2at/zAHMn9x6mwRHTv+FSYYfn8RhAAHPZ/b/7Qhog==@vger.kernel.org, AJvYcCXr2Oa5McJM9qm6QjZU9rynNkPSTMNQgUN0vxwAgHq3pb/RDAzgZfor+h6mrIXRrJtv2JqkjgWKeL5DBtc=@vger.kernel.org
X-Received: by 2002:a05:6102:dd1:b0:4af:3973:6b22 with SMTP id
 ada2fe7eead31-4b2cc4684dcmr45664916137.22.1736171429621; Mon, 06 Jan 2025
 05:50:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211143701.5cfc95a7@canb.auug.org.au> <20241219173156.7dce2f07@canb.auug.org.au>
 <fb6ada81454134c8a37aec7cef17b7c068ebdf85.camel@kernel.org> <20241220073655.0c423a50@canb.auug.org.au>
In-Reply-To: <20241220073655.0c423a50@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2025 14:50:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3SWKkGsekYPAA5eftp4nFUcXQQEPPwut4VOwy3QcsUg@mail.gmail.com>
X-Gm-Features: AbW1kvamwUKD00pR7jpIk0MAAfn6_6DdU-sZLQESs-NTM9MRimdF1-e_c2fuGrs
Message-ID: <CAMuHMdU3SWKkGsekYPAA5eftp4nFUcXQQEPPwut4VOwy3QcsUg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Dec 19, 2024 at 9:39=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> On Thu, 19 Dec 2024 07:40:05 -0500 Jeff Layton <jlayton@kernel.org> wrote=
:
> >
> > I'm not sure how to fix this the right way.
>
> Some other samples define __SANE_USERSPACE_TYPES__ ...

Which is now used by samples/vfs/mountinfo.c...
However, it's still broken on 32-bit. I have sent a fix.

https://lore.kernel.org/20250106134802.1019911-1-geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

