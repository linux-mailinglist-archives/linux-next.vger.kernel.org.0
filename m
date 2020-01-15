Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8ACD13B9FA
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 07:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAOGzu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 01:55:50 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43760 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgAOGzu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 01:55:50 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so11823798lfq.10;
        Tue, 14 Jan 2020 22:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=q+R1zssWix0TQ8FgOoI2Z1/sv+Bj/urTpP+8zFAiWq8=;
        b=A5mmo+/RFePuyaX7839+Wqvzqvboi6QFTj1dqtQfwXoQBzFzXTMXF3DBGArd80ARgj
         MX3aT3fzrFyxfNcI//49XqOGokEnhpTSjA3eqmHBH6gMyyzej8qWshxxSnvc79RoHL/k
         Wb2cwlnGNd2CQCZeJXlmCpnLqIeyHdCqHeOnzCP2AQRb3IvPHVo2xqD/COc/G9Neo8J+
         JorZD9ackg58uf7jLiZwnH0wSyOYkGUosxQTd5gjxTZM8QALRbGUmvtlF2LFDHVg89O8
         20U8ifGn/4tPW87kJmmNb+ynd6sDQ4DpOVpUbzyN/TFDBWfJh4EMrdUqDsr8pOpscPMX
         F6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=q+R1zssWix0TQ8FgOoI2Z1/sv+Bj/urTpP+8zFAiWq8=;
        b=c/uGz/z9n1PsiZp/zpYq3aKMOYNBCFd6mDCa/fP4IE3i4U9MG2DqeXT5APk9am4wg+
         /ueNENRgzRWAQvCYPh1a9Gd74xoP6M+tNuSee5wjGHzRlxaOxtmDSnvrtT4NfisRTRle
         idLPMraBWpZa+QgxTRjG/c6nxf0XTjgemxBTz9uAknyBtqTvRgRZ26OWY6W+VraoqBj+
         WoH6xtLQNwF1BkFx0wjou4bVzYlmxonQDxpZsKLxHaZ7z3QYqyfqgSKOthHT5/jcfRoQ
         VC7R+qJM968vksGAKxISeKwaFHQXddriElbQoqpqeRnp7yp+yOTksHs6j9WTFjq6kIk0
         9KVQ==
X-Gm-Message-State: APjAAAUQ2kT0BWsHLsjDkjkssHJrQPSbYVrWsoc48oCLBF1JzazmDCtm
        BhN9/mCGWHbJ4mlFlolr9TY=
X-Google-Smtp-Source: APXvYqyedsKTu+tr8GwOvp/I8UuSfGRhYMIdso0L+Assy+Bz+4ri6OE19nWego7p8aaWnDLC4PEu3Q==
X-Received: by 2002:a19:6509:: with SMTP id z9mr3878224lfb.97.1579071348183;
        Tue, 14 Jan 2020 22:55:48 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id s16sm8428132lfc.35.2020.01.14.22.55.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 22:55:47 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the usb-gadget tree with Linus' tree
In-Reply-To: <20200110153207.70c888cd@canb.auug.org.au>
References: <20200110153207.70c888cd@canb.auug.org.au>
Date:   Wed, 15 Jan 2020 08:56:48 +0200
Message-ID: <87sgkh6wcv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the usb-gadget tree got a conflict in:
>
>   drivers/usb/cdns3/gadget.c
>
> between commit:
>
>   f616c3bda47e ("usb: cdns3: Fix dequeue implementation.")
>
> from Linus' tree and commit:
>
>   4f1fa63a6dc2 ("usb: cdns3: Add streams support to cadence USB3 DRD driv=
er")
>
> from the usb-gadget tree.
>
> I have no idea how to handle this, so I just dropped the usb-gadget tree
> for today - it clearly needs to be rebased on Linus' tree anyway (it
> has a few shared patches that are different commits and there are
> further changes to this file in Linus' tree as well.  rebasing onto
> (or merging with) v5.5-rc6 may be useful.

I'll rebase on top of Greg's tree

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4et7AACgkQzL64meEa
mQYcsBAAmke9nPMOoXq+fq+uC73pONOD2Sp2gsEx2rLLyxJkmfpWRJLKyZFJhHYK
xoptyKzOUE6Y/0UyGRU8wTUMsfvoaK2MR4n3elyImttqY7ElGrMx8vQ9mrPwYrjB
iNlZYHyko9Unrqghp8Fwy/ehx9gU+Bncip+yExgchiYHJk2epd57fFnEi/gOgLIr
KCIqKqA+gLt3SIaQTrlm+Bo3wKDWazTxsie2bA5pP/bYn0dUXfCFSD60UqI1daRV
DvBr3z36zpu8y6d/oZ0aSR9DQfHggeFjBPh67yRHoDCFNgbqlvKBxcg8JyJsDf5q
Em6xsQspoqvtcV6l783VCV5CCjhzz2k2nkGIAAXLCwuMc8rg8T/5AmQ/BtGohplx
EnyeRnXZbAVbqKDv0NrOHppqswS+7Uk21hg17CgrKqwnRYsEZMMErqi88jUVtDe8
s8FKJpn4ByZPZPIXNyAhsPwaaZBkw4DCLlP9JpoG1UsT95NwKp1JAcRj4v266KuB
+eyUaAbGo/tvNAY/n3RxBaKNI++8tYtWpFA7VsMHLKqX/6R5Pa8F6lubapLm3I0D
s8v5R4fFiXsDl/7oSiwAIfBsWx1gnP/ecFO1uESyTErVS4hNeKtiobGVwOLZ7auN
QUyYwP2s7t7NUDY7+cAely+RImkGtzyWRKYz7yVDeByqkqtVVMQ=
=BT1r
-----END PGP SIGNATURE-----
--=-=-=--
