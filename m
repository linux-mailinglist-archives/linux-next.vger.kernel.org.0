Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849BC33DFC8
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 22:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhCPVIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 17:08:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35277 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhCPVHu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 17:07:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0Qq70RfNz9sVm;
        Wed, 17 Mar 2021 08:07:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615928868;
        bh=KOfhboZ2EAC/BynPOrI8fT0IbPi+1mIjnRowCgT+YQo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KUB0csnqr3khC2vUcnOlttFhjF5QZ/bZ1RwojvGWUJkuS7KjmGjPGKx69SSsJuNo+
         TNeCA45q4BRHE8QiDusVHJdGsrJz07ZkOzzRsFT5YICqVO0w9QvSw0fJ+GkY2a8njf
         gFbtyrlNNMrUIUUHiZXwrIrXTSJhOmMHfGT6GDwjaIYIEabWtC8ARNIT+VaVy3jSCv
         czMcYCq1am7P4FSroeL7rCVCOcAAgODkwOG3odR80v6yViUCl67A3GrcPZnasgaEm4
         fAej9UpnXsuAAaCgDXq0K9leWeH+9rOQcZFXkyTAlN2E9s2ohvvp9pSvomZ8NYVf73
         YFHFNet9RsnJQ==
Date:   Wed, 17 Mar 2021 08:07:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>
Cc:     Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210317080744.33f5c6a9@canb.auug.org.au>
In-Reply-To: <20210316150554.32xtihkhvdkup3eq@liuwe-devbox-debian-v2>
References: <20210315143505.35af617b@canb.auug.org.au>
        <20210316150254.GC18822@zn.tnic>
        <20210316150554.32xtihkhvdkup3eq@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WLrdil7jlpsOmUPVPVSbx0I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WLrdil7jlpsOmUPVPVSbx0I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Mar 2021 15:05:54 +0000 Wei Liu <wei.liu@kernel.org> wrote:
>
> > Right,
> >=20
> > so tglx and I took a quick look and came to the conclusion that it would
> > be best if you - provided it is not too much trouble - keep applying
> > this patch so that linux-next can get tested properly and we - Wei or I
> > - explain this merge conflict in our pull requests during the next merge
> > window and ask Linus to merge your patch ontop. This way we'll save us
> > the cross-tree merging dance. =20
>=20
> Totally agreed. :-)
>=20
> I've made a note to inform Linus about this in the next merge window.

No worries, I will keep applying the patch (my setup allows that to
happen automatically).  Linus should apply it as a part of the merge
resolution (as do I).

--=20
Cheers,
Stephen Rothwell

--Sig_/WLrdil7jlpsOmUPVPVSbx0I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRHiAACgkQAVBC80lX
0Gx+Rgf/bfAhsBXyqL5Zai6OUKdZbC1+XfBnAGJ8k/fENNYMje8yQ6/h2+T9hsmG
5I6uoiXQjWwonUfGbDqJ5hu525Ap/qZdYVok7M0GxgtE5Q/reSr8rg51GLY8MFYz
trZhPblpvMncwQ4QdfvssgZVILz6cnennHAvDDXu//qZM7gYIAwKRg8jZlC/+6uK
MPuh+OOQw+R+HQGNdUMKJCy91vzGYxO/tHZgvgD5zcDC4RfZeNkiTt6mqT4NUqET
eTQCFb+F2WP4FhL8HvJ6UiiugGmyFIl5uX9NxLi6Fvp9yc8j6Lj2sdZkuxkZzD4+
JUTrP4sUmJv5FBXxu0YyRsjKKVhQbw==
=wI+K
-----END PGP SIGNATURE-----

--Sig_/WLrdil7jlpsOmUPVPVSbx0I--
