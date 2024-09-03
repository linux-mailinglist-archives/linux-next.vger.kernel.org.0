Return-Path: <linux-next+bounces-3564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C089694EE
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 09:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67141C21821
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 07:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3869B1D61A2;
	Tue,  3 Sep 2024 07:12:43 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C561D6C46;
	Tue,  3 Sep 2024 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347563; cv=none; b=KX2DvRnq3TLveVJKmHR5eyKhL56oPIsiTYu94e5ZYvlDQliox4RbvjZAl7WoYY0lnlSl+KVFaBUG7vUhuILr6QDxVKHIMPydEPHgwg69jBtxKjgY38WE+vIItmowHzz1B9ZMgESDRQT1xr+iQ+9YOjE5OIhNvdJeZ1FLPuJpHlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347563; c=relaxed/simple;
	bh=p8keF76HnoLatDd++DRUWwYtqSTOQjohxUhzI5FUvHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g036KXMKUfq3Xb2YM8di5ZxBaLiKC8Aq3tuX8s0cH/RtO0kc08lgztS36CfYHgERQltwznIfHea4FIJ6MmN9BdB5OdsI72FQNWnvr4NJCdHSbOlyEQuKfl0ckgL4ftGt1rYfbCndd13tJ9Lh0tbSCILNgbct9WpTmMCYzup+748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-690aabe2600so39888767b3.0;
        Tue, 03 Sep 2024 00:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725347559; x=1725952359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JjNkxlDWbpJw1TND51fYvDcf8fDb1yawSBroXVLtQY=;
        b=ORw05h/VUFPXgUxL811nmR5+NNCeGkYCy16hGAWWa6w/8YaEMsnyqilIbjUnYJCYbS
         nzkz3pYli8vr492IxrmLV7RrwM5iHR6hK92RKUbgoGEYFCmqRNRHRacD9UU+28sGLNx8
         NssnZL0biFkLWfJot1E7FSNUJ3dR+oZ40J9LgXYddkUs7OdxRbhaGeArQvk9bgwi7vH8
         3ZRfFZ2EKGfyV2FZ0kTzMEwg2pK3yXLxmPzhx7I4A4PCi6OTdZ7rJIxXV1zn0rQTovAK
         ZXhyHTtTh6ZqQbswSK+Y1WjYMG6VmHjBat7jZjWJTx2JW/1oqUVQ5E+yA2rCv8ePVCMY
         zgIA==
X-Forwarded-Encrypted: i=1; AJvYcCU4KgUAdSeLoJ8a4SH27Bf79t2osm+IouOttVSrJQFhn+E9mvFsM89CJXQHJzI3EtHh8/PS1EEcG11Wbw==@vger.kernel.org, AJvYcCVp85rttDhaUqQS94Eb4tEAC4eZMNpFrfjarlzNSX/zqIYbsbFmIIul6cXFZN2CexGbl0kjtunEHGcw1Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4+OpwgKXCD3tqYB2lrQjA1TRO0hiMTQ9Ccm1N4IDwgUW5Ml4
	4uAXGG2u7erxtdF7o+58cNwj3w8AHEoeZvi54q/HGvzRCRU9zpXCp6NjJ9oX
X-Google-Smtp-Source: AGHT+IGBU7gMwQqs+0aFj7dkIv2b8ftIfHkX1jgIHrtwHMovUeEzWF0iE4QX6W0YecpK1e4myjZrQA==
X-Received: by 2002:a05:690c:82:b0:6d3:98b1:e3bc with SMTP id 00721157ae682-6d410cb367amr169139767b3.32.1725347559174;
        Tue, 03 Sep 2024 00:12:39 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d728c40e45sm6913447b3.0.2024.09.03.00.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:12:38 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6b47ff8a59aso44453867b3.2;
        Tue, 03 Sep 2024 00:12:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvk0cMYRqtTcOTOt+0rSQK7GWlKGiLGQj1A8AjxkKAnW9f9xBehTEVt9wNQLfEPKuQKoCcwscxwgDP4AI=@vger.kernel.org, AJvYcCWVIjrMP7j3EMdgLIEApj415/pQmNOcAeMX8f1L23DHsgTqRHvbam5dqffQ8Ce8fm8oritgC92u5SAmlA==@vger.kernel.org
X-Received: by 2002:a05:690c:82:b0:6d3:98b1:e3bc with SMTP id
 00721157ae682-6d410cb367amr169139387b3.32.1725347558405; Tue, 03 Sep 2024
 00:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903112703.5e9e68b3@canb.auug.org.au>
In-Reply-To: <20240903112703.5e9e68b3@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Sep 2024 09:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmBeUwhiaLkwV4z2xb67PHBjyJnp3VEMfHv52KAmaQpA@mail.gmail.com>
Message-ID: <CAMuHMdXmBeUwhiaLkwV4z2xb67PHBjyJnp3VEMfHv52KAmaQpA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the clk tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Sep 3, 2024 at 3:27=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> The following commit is also in the renesas tree as a different commit
> (but the same patch):
>
>   042859e80d4b ("dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG"=
)
>
> This is commit
>
>   afec1aba0860 ("dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG"=
)
>
> in the renesas tree.

Thanks, I am aware of this issue.  Due to an oversight on my side
when queuing the RZ/V2H clock driver one month ago, I forgot to put
the RZ/V2H DT binding definitions on its own branch.  As these binding
definitions are needed for the DTS part, too, I had the choice between
merging in lots of unrelated clock commits, or just duplicating the
aforementioned commit.  Hence I picked the latter.

Sorry for the troubles.

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

