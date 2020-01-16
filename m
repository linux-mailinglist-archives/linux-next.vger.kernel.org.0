Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8611413D242
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 03:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgAPCje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 21:39:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729559AbgAPCje (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 21:39:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ypLW1t7yz9sR0;
        Thu, 16 Jan 2020 13:39:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579142371;
        bh=wwSov16NNA8eswhryaE9UVLHmePc/RJK9qgpOXHnWd4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DACA5Q1+K6Xubv01HoN0I+VY0B6GvNV2+HNVMUHkr3DrgLR6967Ruzl8cgBKCF3ly
         GnPZC3QOGgAUAUh6W7XlAUEvVnDW+ff5zQl3xn8VQHI/+cMqfe00yImz54P1vgGf1j
         ZJoWNIP/5+qVjzgxDZcT3kZNxX4blUDYygREfiNDDKeuejt7ylHj3xS+T930E40JOm
         CgueStoiSAI4n37zEkRCPokkIg0xNHAan/3TE/xPj3pxLpwrvNGCLAKrK3hCX0n3tk
         UMB5O+b9Fq0Yfc05pe1T17WkgvcTlvSqx2XnX5un3/9l19Lgu/alsS1Zn1ERx7DwGH
         o6AUXH4HCfd3A==
Date:   Thu, 16 Jan 2020 13:39:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the usb-gadget tree
Message-ID: <20200116133930.74afaa91@canb.auug.org.au>
In-Reply-To: <043cbd87-1d7d-e998-04a8-bbc9aec686df@linaro.org>
References: <20200116070726.7e2ef8cc@canb.auug.org.au>
        <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org>
        <20200116124100.58af81d5@canb.auug.org.au>
        <6b984328-b3f4-a23d-efb3-7e7955ad165a@linaro.org>
        <20200116125851.474f3021@canb.auug.org.au>
        <043cbd87-1d7d-e998-04a8-bbc9aec686df@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8bjwNIkrgQ751QRdgJdr8ni";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8bjwNIkrgQ751QRdgJdr8ni
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

On Thu, 16 Jan 2020 02:08:55 +0000 Bryan O'Donoghue <bryan.odonoghue@linaro=
.org> wrote:
>
> On 16/01/2020 01:58, Stephen Rothwell wrote:
> >=20
> > On Thu, 16 Jan 2020 01:45:25 +0000 Bryan O'Donoghue <bryan.odonoghue@li=
naro.org> wrote: =20
> >>
> >> On 16/01/2020 01:41, Stephen Rothwell wrote: =20
> >>> Hi Bryan,
> >>>
> >>> On Thu, 16 Jan 2020 01:19:22 +0000 Bryan O'Donoghue <bryan.odonoghue@=
linaro.org> wrote: =20
> >>>>
> >>>> How should extra long fixes like this be divided up ? =20
> >>>
> >>> Just let them run on even if they are too long i.e. don't split them =
at all. =20
> >>
> >> That's what's in the git commit log though isn't it ? =20
> >=20
> > When you add a Fixes: tag to a commit, you quote the subject line of
> > the commit you are fixing which, by definition, is a single line.  We
> > want to keep it that way so it can be searched for easily.
> >=20
> > So to create a fixes line you can use this:
> >=20
> > git log -1 --format=3D'Fixes: %h ("%s")' <commit being fixed>
> >=20
> > i.e. in this case:
> >=20
> > $ git log -1 --format=3D'Fixes: %h (\"%s\")' 40d133d7f5426
> > Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function inter=
face with backward compatibility")
> >  =20
>=20
> doh sorry still not seeing it
>=20
> git remote -v
> usb-next	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=20
> (fetch)
>=20
> git fetch usb-next
> git show 5b24c28cfe13
>=20
> that's a correctly formatted fixes right i.e. the same one as above
>=20
> :(
>=20
> not seeing the difference...

Now I see our confusion.  There is another version of this patch in
Felipe's tree as a different commit (6a6ae4e8e926) which has the Fixes
tag split ...

--=20
Cheers,
Stephen Rothwell

--Sig_/8bjwNIkrgQ751QRdgJdr8ni
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fzOIACgkQAVBC80lX
0GwXoQf/Q7fcXZ24AxZZ5wvRgp2jqX4PaOKj+wNvbbYmqrsCkrnRQ2NsVsz3hxvs
iLSXkggMlfL8AW8j2/utwI2SQ5+kwGRISkGNf7pTA+D+qbkyZVoCi+pNWCAu80+4
4HtlMxKP3Q6gNs9uF9CFDXPX7L7EaIMbcUUIFX+VCz013sLT8w2vRewqzVXsHWxn
Fez9vLKoYRTKw8875XWi+XXrj03AsguG+Q+miTR9k6DMuN35JkxZc+tFnBAfO9W/
iId5mTWfDyay5r4FjjY9Oh/d7OnP5onQHnE+T+FK4QEQEQ0BTsf+s+sfdWKVw5WM
0mYIVcy9jdWGvY5htg26JrwhopZsWA==
=Kd58
-----END PGP SIGNATURE-----

--Sig_/8bjwNIkrgQ751QRdgJdr8ni--
