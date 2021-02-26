Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84530325B66
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 02:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhBZB5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 20:57:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhBZB5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Feb 2021 20:57:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dmt7d3kZTz9sRR;
        Fri, 26 Feb 2021 12:57:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614304622;
        bh=OleYR+fMRGZsaEz51vtPDlFLnrVZUk7tfQKY29tHGRs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pilklv/ElQtRZmeOhkYGQYNOY8QYS32A/LqPHh9BWGURCGPHbf8RJki2WlLTYGaP7
         8IsxGr9l+G/Pqj7xH6ly4tVaxR37I1dlJi9NglhoBCNXPqe/rBZBXDU2xSSZB9GJ1u
         LM4qM8hzLwfU0KMhk7IfEzpB6+lILAsqV4U95W6FJJtwrEMGXcENPyFFJMRfzj3o0o
         KMMglK4OAlLguoQj1O4Ni96F+ojbcgcgspH+fnrdvwLuc0BE90mZP6v/JcSEjjj59h
         /m+1U2/2F05imvW/XKNiANQpv8N5ElzzlGRshTms/h7lZ+lz//+seQL0/e4Sk5VIW2
         59wNkNcrVBRHA==
Date:   Fri, 26 Feb 2021 12:57:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: linux-next: build warnings after merge of the origin tree
Message-ID: <20210226125700.211c9c9d@canb.auug.org.au>
In-Reply-To: <20210224085654.34e61ec7@canb.auug.org.au>
References: <20210219080235.52c8c7f4@canb.auug.org.au>
        <87pn0w3wde.fsf@vitty.brq.redhat.com>
        <f93b780b-7027-0f05-7288-04f313cfe86c@redhat.com>
        <20210224085654.34e61ec7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+uxZ6PH543CHJMgKHT=SeQW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+uxZ6PH543CHJMgKHT=SeQW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 24 Feb 2021 08:56:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 19 Feb 2021 17:01:13 +0100 Paolo Bonzini <pbonzini@redhat.com> wr=
ote:
> >
> > On 19/02/21 16:33, Vitaly Kuznetsov wrote: =20
> > > Stephen Rothwell <sfr@canb.auug.org.au> writes: =20
> > >>
> > >> Building Linus' tree, today's linux-next build (htmldocs) produced
> > >> these warnings:
> > >>
> > >> Documentation/virt/kvm/api.rst:4537: WARNING: Unexpected indentation.
> > >> Documentation/virt/kvm/api.rst:4539: WARNING: Block quote ends witho=
ut a blank line; unexpected unindent.
> > >>
> > >> Introduced by commit
> > >>
> > >>    c21d54f0307f ("KVM: x86: hyper-v: allow KVM_GET_SUPPORTED_HV_CPUI=
D as a system ioctl")
> > >>
> > >> These have been around for some time.   =20
> > >=20
> > > I remember seeing a patch fixing these:
> > > https://lore.kernel.org/kvm/20210104095938.24838-1-lukas.bulwahn@gmai=
l.com/
> > >=20
> > > Paolo, could you please queue it up? Thanks!   =20
> >=20
> > I was expecting Jon to pick it up, but yes I can do that too. =20
>=20
> I am still seeing the above and have noticed another one:

So the above are now gone, thanks, but the below is still there (line
number changed to 5004).

>=20
> Documentation/virt/kvm/api.rst:5002: WARNING: Unexpected indentation.
> Documentation/virt/kvm/api.rst:5002: WARNING: Inline emphasis start-strin=
g without end-string.
>=20
> Introduced by commit
>=20
>   c32b1b896d2a ("KVM: X86: Add the Document for KVM_CAP_X86_BUS_LOCK_EXIT=
")
>=20
> (Not new, but newly reported - or maybe just changed line number)

--=20
Cheers,
Stephen Rothwell

--Sig_/+uxZ6PH543CHJMgKHT=SeQW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA4VWwACgkQAVBC80lX
0GyfaQf6A++Mv+8BdtKe1EWiDBIKxbs4QF9mhayfROb4jra0oB1sJjMjF7YQN2qK
gY67Whj3dCfQedvY+7aDVl4Z6ctmlnIsdoDF47d//HMAeqp3aSt7tjw09Z6cZ35b
i/Uz+9ck+ZulATgtMQGYufN8oAb6UdeGLDqjcq9pwFT/86N1EqlE5TXtvIVxbZQP
PlyKmmn4pxkrl2H3ELvs2N9dPYi5g/FNDNzH5GVvnbnkvUrE8BYfeR2ws5Px7PUO
cx3HR4kPITqk0hizBQU/3d4cTaT+ye0bizeQc2wnbfZBd5t05agnN+ZLksUZwpK4
rLcG7OjLjaK3BrHePD1fBC/UnMRP9A==
=Mc5L
-----END PGP SIGNATURE-----

--Sig_/+uxZ6PH543CHJMgKHT=SeQW--
