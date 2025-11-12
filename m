Return-Path: <linux-next+bounces-8933-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED7C51968
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4E8189EBDE
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7EE2FFDC4;
	Wed, 12 Nov 2025 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7WS0IRr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660F2E54CC
	for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942275; cv=none; b=j/Tr+Cw2oOwjWBOrPh0MuevY14banuXAMhFmHRyspYnAuujqN1zaWAyWH4h7KML3lVS854jlQuZfODMZZXIbM+ppoYSjdLfAZB4cLHJ1YQzOMGpnfawK2XhoTICpyIArzaGBUY0wo7C8QHmv85/p/CVKCHBjn66ccfmOA2c//yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942275; c=relaxed/simple;
	bh=tNocBzsJV86eckoBtE0ynZR/b1P0jO3l4C2nresbuK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbPTxXzqDVtEmNn9gf3+DSSObF96ZaioyQK093drH7S7zChWndsWm4lrxtN2mcL5aR3y4IqaMoVenmyiK7ymaqMxnEG3zWHrHEsLL13ILFiOvoVDCsMippXiggtCNGxRMKwLHg+aBr6u3nr65nabM+foFuM4cxpDtOp4BSQweBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7WS0IRr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso917996a12.1
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762942272; x=1763547072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9NHrBs3mZFq6b+tMfQ1T86WYq2WJ+VL4xl3O9xdEqU=;
        b=e7WS0IRr8n+zS82b4dhUxPknyYrB5qgBFQS5NiNw7DgsAPgzIxi2vxICZxYGrNnivO
         XUIkHnOceOMnlzRnRiwrBUjQomcmMxT8sWne6UfnVmcUC8DXi1GWdLtFhHL3+DIS2UDg
         a9LPg8pOvrogPqXPckX2L3stl8oYoryBLACeh6gBG3feh+lEaBklMkh2yOHl3w4pGY/M
         Qcy2yuTS8DUHs6lBPIamnP2rSL20igdVb8xSTnt+zv/PerujzL3orLqJxh3eyKyOfYFZ
         IOAf7CWNZV1/iy5fMlKyK6ndM2o/+t8pJDLMAnfwJCQKSpeXagE9MtDSghfK0iRohWEL
         W9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942272; x=1763547072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u9NHrBs3mZFq6b+tMfQ1T86WYq2WJ+VL4xl3O9xdEqU=;
        b=uYeD8TA24o3UuQjBB66q4Fy+4HGa+21R1Aue4WIyMz19EHrvfQ5x5UqzkLcr2H5dAi
         LTrBDN84wXP+XXlyBaU4aX0cVEvWfV9tFsgCwigSnorvbeb4rUZo20HcqPG0xrSKk6zr
         8/9b9jxxN38hTLvm9JwxPqI75TZ2HAIQ5fde5AYXTClovfO9UZTEcwLTkqyF+fx7HS5J
         4pYHbC1HEanJ3MTxxLsLR5D/byutvqkSW+jVMFwTTWKbSlkoXbcnioByHXAbB2cX31Uc
         G1faEvQkrXQCoXgK7VxLRwMJNffs/7WGyWIIgba1IHnHBmcghg5RmYUynXFDnkQwNQyZ
         jwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX523ktxaER3JqYMgvzAOTELTMNINWfinIEsQpbQDglWvDwSCODlRMDA6xEDqTnKswj54FJ3OdocCO0@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHqyoKAuQDylcivtebRX0YsQ3tR9vCf2x7v9Blbu3lKkxc7QJ
	FkxDhdcMyE0oA/+yrnT7OUcJvJWsK8mKNfVkRQ0XKFjTrzi8Wfff62YAvi6AEDVFYgEqeMuk3Vp
	lKg2Osh03IFeogWoX+NNHnAFikJR9kjc=
X-Gm-Gg: ASbGnct9Ev2vRmAbnDSjgSxV2bhIhDV3BBtiosMuCrFkZOVvaf0IkW631gebVxuStdQ
	yiRP5Xd05HeMk2ITl46nX9nRdxo2MeBv2FoACVzIBre4hbrcen3gApHAIqhKeVxo0//z9ufO7PI
	WStEIFnjQLqlaUgmfIcBxgVixGto3O07+H+ypfEudfj6Iiwj6sLOIIT42DTzQ6IcRYHtc50W+t0
	suUbmT3/x5tTVWDsvQBLJBU6+larxZ3j4nz2kvMtaTowJaOrnL9UsFT8G9IR3ZHAG0CEYzN1GFM
	ChNOgfajuCR3PhHLAoL7Dekjcw==
X-Google-Smtp-Source: AGHT+IHUeUWTvDFqepqZuvsLnZH2K88c340GpPNa6ePpK37sZV5pJFkugw7jPksVyrY1UDeuOSv1/2frwTRfOG37ayI=
X-Received: by 2002:a05:6402:35cf:b0:640:c918:e3b with SMTP id
 4fb4d7f45d1cf-6431a54e61dmr2238026a12.26.1762942271710; Wed, 12 Nov 2025
 02:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112134242.2608a613@canb.auug.org.au>
In-Reply-To: <20251112134242.2608a613@canb.auug.org.au>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 12 Nov 2025 11:10:59 +0100
X-Gm-Features: AWmQ_bkQlCM06IRDMffIO574kF_cpZGaK3SWrtXGjq0snebuCnZ6wjsmsmbWWVs
Message-ID: <CAGudoHEa=4HueuL8Ypfd5VNVyo5fEsfeY2+6c3nA2mvhXNt5Kw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:42=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> WARNING: fs/namei.c:627 function parameter 'idmap' not described in 'look=
up_inode_permission_may_exec'
> WARNING: fs/namei.c:627 function parameter 'inode' not described in 'look=
up_inode_permission_may_exec'
> WARNING: fs/namei.c:627 function parameter 'mask' not described in 'looku=
p_inode_permission_may_exec'
>

That func is a little special and I would argue it should not have
these documented. Is there a way to exempt it?

If not, we can repurpose inode_permission:
diff --git a/fs/namei.c b/fs/namei.c
index caeed986108d..edb1c98888a1 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -607,6 +607,9 @@ EXPORT_SYMBOL(inode_permission);

 /**
  * lookup_inode_permission_may_exec - Check traversal right for given inod=
e
+ * @idmap:     idmap of the mount the inode was found from
+ * @inode:     Inode to check permission on
+ * @mask:      MAY_NOT_BLOCK or 0
  *
  * This is a special case routine for may_lookup() making assumptions spec=
ific
  * to path traversal. Use inode_permission() if you are doing something el=
se.

> Introduced by commit
>
>   5ecf656231cc ("fs: speed up path lookup with cheaper handling of MAY_EX=
EC")
>
> --
> Cheers,
> Stephen Rothwell

