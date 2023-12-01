Return-Path: <linux-next+bounces-187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E18012FB
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 19:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09541C20935
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 18:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E771D53A;
	Fri,  1 Dec 2023 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WplXVf4u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C53110F0
	for <linux-next@vger.kernel.org>; Fri,  1 Dec 2023 10:45:55 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6d83ff72dbbso381188a34.1
        for <linux-next@vger.kernel.org>; Fri, 01 Dec 2023 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701456354; x=1702061154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXMK7gYwKBc2+MSS7X0vjsoPudj5rbIJ6yvk1AkwxJg=;
        b=WplXVf4upWCCb7CSbt38ErPIoI9Z2UDLLOLNyoBFQnsRyk2Z4bjY5AF0EhPtZv0/U+
         eGgmMbF/9N7qeooIIOi0vixdaXdXVdCt7q1pieel0OM2FiPnXuGvYtP/TgF1oD6gg/va
         Q8i79uo/gXeHA0nYR9KTh1f8xccuABMnxxrLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701456354; x=1702061154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXMK7gYwKBc2+MSS7X0vjsoPudj5rbIJ6yvk1AkwxJg=;
        b=aOocNSK//7fnN8r2kRybSnI+lcH0W86VCCx0+4nb2r4D3rx192jKs0gQOqYvVOxaRz
         z0NQFYCLIow5ydN0DA3PknUibPnGLLiMHzcqmjQ46Qw06wCKXmj4sGwcw4dF4dWIkxzC
         a9+gN+mNa07etyVMyUhgAdPgunYahNveI0v4L/IqmTRd0TImtvkcpJrpQJ7DgnGnqGhE
         5wZsvADTqJb85xDS7vsCqxr55d748xcUlX5TmYWd+KUmnsoNH1DGiYkM6KMSCgkTD1PP
         4gtsgHvxAFgBzAC+qt3VBaGkL2Pk372CCy1xf9y3wQueN2BIR9sJsFeylEW2Lfmkc4qJ
         9peQ==
X-Gm-Message-State: AOJu0YxuUsbUawBsfc70oFtyPLW+i85yb0PHCoEWUCYsxQ1aAYNjOCiG
	ZUtkXvqhTWd9wDWJxhG9OIMlTYdUws7DA4b35uWuMg==
X-Google-Smtp-Source: AGHT+IHMHMcYPYJEIHVAEic1PgqT5IKoS7UnELlwPN8I0iVdtmL68Gt5D+mP/xNOZdR+tp4wkE0Og5lhbpj2EQiyud0=
X-Received: by 2002:a05:6870:724f:b0:1fa:2fbe:21f6 with SMTP id
 y15-20020a056870724f00b001fa2fbe21f6mr11207646oaf.12.1701456354652; Fri, 01
 Dec 2023 10:45:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201181542.421077-1-dregan@broadcom.com> <20231201193834.5da80273@collabora.com>
In-Reply-To: <20231201193834.5da80273@collabora.com>
From: David Regan <dregan@broadcom.com>
Date: Fri, 1 Dec 2023 10:45:43 -0800
Message-ID: <CAA_RMS7DJEdC_uUcT2MF4crVvPFiDGCpx+wKGYtPP=u3xRuOAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: Add deassert_wp comment
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dregan <dregan@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon <bbrezillon@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry my mistake, I had originally missed this comment which came from =
here:
https://github.com/bbrezillon/linux/commit/e612e1f2c69a33ac5f2c91d13669f0f1=
72d58717

On Fri, Dec 1, 2023 at 10:38=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri,  1 Dec 2023 10:15:42 -0800
> dregan <dregan@broadcom.com> wrote:
>
> > From: Boris Brezillon <bbrezillon@kernel.org>
>
> I'm pretty sure I shouldn't be the author. The original patch might
> have been partly written by me, but this is a fixup on top of it.
>
> >
> > Add deassert_wp description comment
> >
> > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
>
> and you should drop my SoB too.
>
> > Signed-off-by: David Regan <dregan@broadcom.com>
> > ---
> >  include/linux/mtd/rawnand.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index fcad94aa0515..3049b05d8a20 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1001,6 +1001,8 @@ struct nand_op_parser {
> >  /**
> >   * struct nand_operation - NAND operation descriptor
> >   * @cs: the CS line to select for this NAND operation
> > + * @deassert_wp: set to true when the operation requires the WP pin to=
 be
> > + *            de-asserted (ERASE, PROG, ...)
> >   * @instrs: array of instructions to execute
> >   * @ninstrs: length of the @instrs array
> >   *
>

