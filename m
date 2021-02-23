Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7A4323385
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 22:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbhBWV5j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 16:57:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232735AbhBWV5h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 16:57:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlXvW2WY3z9sSC;
        Wed, 24 Feb 2021 08:56:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614117415;
        bh=H0/jxmmX/Up6Xlvie5Gq8N2goFhwOkEfjl+kbJV5Ml8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZJ0kp9KjLsJpmfO+A1dHyBUEMsvAvvKWQxaIusmMhJzfzEQlAqyaeGY1x9CkwqObN
         hhWl5/2L2zsEKSWfownhPLcUK/e0LzdVId7PZaiTe2ulhrceMeNcAKiyFrX3PObNTJ
         J2PKNYg9vUdY2knr7avjEz7B0Dv8yg8kh/IVlauZEE0UC0nz2jOTo2bPCLrSkrF9Fl
         nMgPgq7wUrHrQNIxrIQyxg4P5ygTsVO/ziLmt8euD2Ptc70ml7QGmbMtVj+n7nMf+8
         SLvPYkNNahvbGhFDmovpqr1NNQDluCB6CtB2esalPEhaFgfVNduwHDQ4K9EXgCSWO9
         9TmwmPu6EnUCw==
Date:   Wed, 24 Feb 2021 08:56:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: linux-next: build warnings after merge of the origin tree
Message-ID: <20210224085654.34e61ec7@canb.auug.org.au>
In-Reply-To: <f93b780b-7027-0f05-7288-04f313cfe86c@redhat.com>
References: <20210219080235.52c8c7f4@canb.auug.org.au>
        <87pn0w3wde.fsf@vitty.brq.redhat.com>
        <f93b780b-7027-0f05-7288-04f313cfe86c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b2di1KiLCF5bupZ3IL8DWYT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b2di1KiLCF5bupZ3IL8DWYT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 19 Feb 2021 17:01:13 +0100 Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>
> On 19/02/21 16:33, Vitaly Kuznetsov wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >>
> >> Building Linus' tree, today's linux-next build (htmldocs) produced
> >> these warnings:
> >>
> >> Documentation/virt/kvm/api.rst:4537: WARNING: Unexpected indentation.
> >> Documentation/virt/kvm/api.rst:4539: WARNING: Block quote ends without=
 a blank line; unexpected unindent.
> >>
> >> Introduced by commit
> >>
> >>    c21d54f0307f ("KVM: x86: hyper-v: allow KVM_GET_SUPPORTED_HV_CPUID =
as a system ioctl")
> >>
> >> These have been around for some time. =20
> >=20
> > I remember seeing a patch fixing these:
> > https://lore.kernel.org/kvm/20210104095938.24838-1-lukas.bulwahn@gmail.=
com/
> >=20
> > Paolo, could you please queue it up? Thanks! =20
>=20
> I was expecting Jon to pick it up, but yes I can do that too.

I am still seeing the above and have noticed another one:

Documentation/virt/kvm/api.rst:5002: WARNING: Unexpected indentation.
Documentation/virt/kvm/api.rst:5002: WARNING: Inline emphasis start-string =
without end-string.

Introduced by commit

  c32b1b896d2a ("KVM: X86: Add the Document for KVM_CAP_X86_BUS_LOCK_EXIT")

(Not new, but newly reported - or maybe just changed line number)
--=20
Cheers,
Stephen Rothwell

--Sig_/b2di1KiLCF5bupZ3IL8DWYT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1eiYACgkQAVBC80lX
0GwRFAf/fXosV+sMnk0aD60TgYrF4Umt2houf1RKrCrTDIqkuo6bjLUscVVxkmuH
iArXA5BKbZ6FvHye25mMpB531RWU29WdSn395DSLeZ/YRs0KG0yKXKpySxHMoiem
kZCO3Ib/rSw4a830O7RErOsqgYmsTHEu4WdgkIyCOqHbo6dU3X5MQ+O7Sr7FT8X6
7ZXhncUoVnPX8nJOvit+Awdv20/2BLXTNK3GSeEUmTIuWEdVEmf9QABacRUDkg5Q
PPxtQi4Xyf5wV4gMZRp5X2UDunQFCpSwde1jb9+hvv6eGueSKYYEi9JJNQvHzLI9
dvTe9+F4ScHyBeg+1l9yxmGm2TyMMg==
=y4I9
-----END PGP SIGNATURE-----

--Sig_/b2di1KiLCF5bupZ3IL8DWYT--
