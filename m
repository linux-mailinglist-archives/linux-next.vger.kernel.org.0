Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CFE1A920F
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 06:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393137AbgDOEvy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 00:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389635AbgDOEvx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 00:51:53 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D61C061A0E
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 21:51:53 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w3so813625plz.5
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 21:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tRaZr2pDSuWH5+k9gK63dyub99+Tpfee62FDT1XUPLk=;
        b=c0DJ2wWfn9n2e/+xp0xOTxPzhAe2O6scTqX+VRIo9QRz9VN1V+FSWcxJSyD62ZmAAR
         i03f6x9cSiGWddVotKJlAngVY7E0Wm3gP8On9V/I+Nk54jFkPTn1zgM9wjaqNMHD4s7v
         Uoc5ZGbLesBLVafR0q18s7ewIhhOY5bDkWPzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tRaZr2pDSuWH5+k9gK63dyub99+Tpfee62FDT1XUPLk=;
        b=V3VD3EiQyJfNaV8jGX/dQqwG7hUm8mgFPGxU7E/HKLjW15mNGa404aQZglbpzT3zd0
         uncKofionfWOiHj6FWR8oGpgj1LFA9jxzt1/lEhR3knAA1tzPBQw4wQAYpIvHgG047ds
         ciLJyPeBZJ9N3fQKHEdXv7sMi1PsrDQlbTCe8VwCZCku6zLG5qjFKt+BEgoZhwL7kGn+
         elgwyYf8II9RzQEtxfNMI8tXENTaa597Qf/j/KSTJUZSRLPvhq4X3G2x6Evj+BXPtZns
         t4ARbfUI/5EJEUMvRShcC39z9nBhofSW097Em3DK9oY3pkAEjAVzDz5A1QbFEQpC8x+O
         I59A==
X-Gm-Message-State: AGi0PuZJ226/HCjCMBFdQyIDYKW4FS5IOIKZSdlg/1OrJEEmWDVs3Gta
        GwJXYCF6KISqPL/HxWP9tbjCa/aG5XM=
X-Google-Smtp-Source: APiQypLbYVorUzsPOwd9PNsI32KawNSaZ0Dh1694rAc/lbQUJUWy9zFjZVibw2CuV+L8+qRj9rlgJw==
X-Received: by 2002:a17:90a:14c6:: with SMTP id k64mr4023309pja.39.1586926312202;
        Tue, 14 Apr 2020 21:51:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g22sm5603822pju.21.2020.04.14.21.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 21:51:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415102534.6d22a377@canb.auug.org.au>
References: <20200415102534.6d22a377@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the qcom tree
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue, 14 Apr 2020 21:51:50 -0700
Message-ID: <158692631073.105027.12648118734810371009@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-04-14 17:25:34)
> Hi all,
>=20
> After merging the qcom tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
> drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expe=
cts argument of type 'int', but argument 4 has type 'long unsigned int' [-W=
format=3D]
>   281 |    seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
>       |                             ~^~
>       |                              |
>       |                              int
>   282 |        sizeof(ent->id), ent->id);
>       |        ~~~~~~~~~~~~~~~       =20
>       |        |
>       |        long unsigned int
>=20
> Introduced by commit
>=20
>   d6815c5c43d4 ("soc: qcom: cmd-db: Add debugfs dumping file")

Thanks. I didn't notice this warning. Looks like we need to cast
sizeof() to int? Bjorn do you want another patch or does this get
squashed in?

---8<----
diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 6c308f92a13c..6b5c440c9dc3 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -280,7 +280,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, vo=
id *p)
 		ent =3D rsc_to_entry_header(rsc);
 		for (j =3D 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
 			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
-				   sizeof(ent->id), ent->id);
+				   (int)sizeof(ent->id), ent->id);
=20
 			len =3D le16_to_cpu(ent->len);
 			if (len) {
