Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4EE17EF5D
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 04:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgCJDkX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 23:40:23 -0400
Received: from ozlabs.org ([203.11.71.1]:49663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgCJDkW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 23:40:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48c17f46cjz9sNg;
        Tue, 10 Mar 2020 14:40:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583811619;
        bh=q9e142hLJzua9Tj54JXbb/JjMTmtfzZ/1rAUAdBLM40=;
        h=Date:From:To:Cc:Subject:From;
        b=rWLrlK74n3K8x9lZYmmjf7jpebs1Wb9htMRflOLyK1GF2VFT2S6TmggH6Q6nUbGli
         5z7Aqi05qRNoxXYRx9xi14zpZE9pvPr0OPEJIovFSegRaD1PTsev1JCQIcglRzsbsr
         GzqA1X5rQiMlr0z1IPcgd1vs01wdeXm4FP4nuIqHFLqLE7tpdz1VRrPeqF9Zp7iV0R
         sZXexgBS6tH21tOXCBMIksHToZdTw7thI3SYezJILMzw3ckhSWFrBVEY0MFibozNl9
         FX+HEbZLQaKHEArKcN1Q3tSOLkVBGlgwFXnNob3tcR2Wu6tOEeFYJtEPFejTjv0bQX
         4FMJcqxZ7Az5Q==
Date:   Tue, 10 Mar 2020 14:40:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.cz>
Subject: linux-next: manual merge of the tty tree with Linus' tree
Message-ID: <20200310144013.6df85b46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uxD.9kFF4kivyyCJeIpYqDh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uxD.9kFF4kivyyCJeIpYqDh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/vt/selection.c

between commits:

  4b70dd57a15d ("vt: selection, push console lock down")
  e8c75a30a23c ("vt: selection, push sel_lock up")

from Linus' tree and commits:

  9256d09f1da1 ("vt: selection, create struct from console selection global=
s")
  bc80932cc25a ("vt: selection, indent switch-case properly")

from the tty tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

cdc26c076ff74acec5113c5234093eae54954761
diff --cc drivers/tty/vt/selection.c
index d7d2e4b844bc,b9c517463efa..582184dd386c
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@@ -211,57 -216,53 +216,51 @@@ static int __set_selection_kernel(struc
  		return 0;
  	}
 =20
- 	if (ps > pe)	/* make sel_start <=3D sel_end */
+ 	if (ps > pe)	/* make vc_sel.start <=3D vc_sel.end */
  		swap(ps, pe);
 =20
- 	if (sel_cons !=3D vc_cons[fg_console].d) {
 -	mutex_lock(&vc_sel.lock);
+ 	if (vc_sel.cons !=3D vc_cons[fg_console].d) {
  		clear_selection();
- 		sel_cons =3D vc_cons[fg_console].d;
+ 		vc_sel.cons =3D vc_cons[fg_console].d;
  	}
- 	mode =3D vt_do_kdgkbmode(fg_console);
- 	if (mode =3D=3D K_UNICODE)
- 		use_unicode =3D 1;
- 	else
- 		use_unicode =3D 0;
-=20
- 	switch (v->sel_mode)
- 	{
- 		case TIOCL_SELCHAR:	/* character-by-character selection */
+ 	unicode =3D vt_do_kdgkbmode(fg_console) =3D=3D K_UNICODE;
+=20
+ 	switch (v->sel_mode) {
+ 	case TIOCL_SELCHAR:	/* character-by-character selection */
+ 		new_sel_start =3D ps;
+ 		new_sel_end =3D pe;
+ 		break;
+ 	case TIOCL_SELWORD:	/* word-by-word selection */
+ 		spc =3D isspace(sel_pos(ps, unicode));
+ 		for (new_sel_start =3D ps; ; ps -=3D 2) {
+ 			if ((spc && !isspace(sel_pos(ps, unicode))) ||
+ 			    (!spc && !inword(sel_pos(ps, unicode))))
+ 				break;
  			new_sel_start =3D ps;
+ 			if (!(ps % vc->vc_size_row))
+ 				break;
+ 		}
+=20
+ 		spc =3D isspace(sel_pos(pe, unicode));
+ 		for (new_sel_end =3D pe; ; pe +=3D 2) {
+ 			if ((spc && !isspace(sel_pos(pe, unicode))) ||
+ 			    (!spc && !inword(sel_pos(pe, unicode))))
+ 				break;
  			new_sel_end =3D pe;
- 			break;
- 		case TIOCL_SELWORD:	/* word-by-word selection */
- 			spc =3D isspace(sel_pos(ps));
- 			for (new_sel_start =3D ps; ; ps -=3D 2)
- 			{
- 				if ((spc && !isspace(sel_pos(ps))) ||
- 				    (!spc && !inword(sel_pos(ps))))
- 					break;
- 				new_sel_start =3D ps;
- 				if (!(ps % vc->vc_size_row))
- 					break;
- 			}
- 			spc =3D isspace(sel_pos(pe));
- 			for (new_sel_end =3D pe; ; pe +=3D 2)
- 			{
- 				if ((spc && !isspace(sel_pos(pe))) ||
- 				    (!spc && !inword(sel_pos(pe))))
- 					break;
- 				new_sel_end =3D pe;
- 				if (!((pe + 2) % vc->vc_size_row))
- 					break;
- 			}
- 			break;
- 		case TIOCL_SELLINE:	/* line-by-line selection */
- 			new_sel_start =3D ps - ps % vc->vc_size_row;
- 			new_sel_end =3D pe + vc->vc_size_row
- 				    - pe % vc->vc_size_row - 2;
- 			break;
- 		case TIOCL_SELPOINTER:
- 			highlight_pointer(pe);
- 			return 0;
- 		default:
- 			return -EINVAL;
+ 			if (!((pe + 2) % vc->vc_size_row))
+ 				break;
+ 		}
+ 		break;
+ 	case TIOCL_SELLINE:	/* line-by-line selection */
+ 		new_sel_start =3D ps - ps % vc->vc_size_row;
+ 		new_sel_end =3D pe + vc->vc_size_row
+ 			    - pe % vc->vc_size_row - 2;
+ 		break;
+ 	case TIOCL_SELPOINTER:
+ 		highlight_pointer(pe);
 -		goto unlock;
++		return 0;
+ 	default:
 -		ret =3D -EINVAL;
 -		goto unlock;
++		return -EINVAL;
  	}
 =20
  	/* remove the pointer */
@@@ -270,31 -271,31 +269,31 @@@
  	/* select to end of line if on trailing space */
  	if (new_sel_end > new_sel_start &&
  		!atedge(new_sel_end, vc->vc_size_row) &&
- 		isspace(sel_pos(new_sel_end))) {
+ 		isspace(sel_pos(new_sel_end, unicode))) {
  		for (pe =3D new_sel_end + 2; ; pe +=3D 2)
- 			if (!isspace(sel_pos(pe)) ||
+ 			if (!isspace(sel_pos(pe, unicode)) ||
  			    atedge(pe, vc->vc_size_row))
  				break;
- 		if (isspace(sel_pos(pe)))
+ 		if (isspace(sel_pos(pe, unicode)))
  			new_sel_end =3D pe;
  	}
- 	if (sel_start =3D=3D -1)	/* no current selection */
+ 	if (vc_sel.start =3D=3D -1)	/* no current selection */
  		highlight(new_sel_start, new_sel_end);
- 	else if (new_sel_start =3D=3D sel_start)
+ 	else if (new_sel_start =3D=3D vc_sel.start)
  	{
- 		if (new_sel_end =3D=3D sel_end)	/* no action required */
+ 		if (new_sel_end =3D=3D vc_sel.end)	/* no action required */
 -			goto unlock;
 +			return 0;
- 		else if (new_sel_end > sel_end)	/* extend to right */
- 			highlight(sel_end + 2, new_sel_end);
+ 		else if (new_sel_end > vc_sel.end)	/* extend to right */
+ 			highlight(vc_sel.end + 2, new_sel_end);
  		else				/* contract from right */
- 			highlight(new_sel_end + 2, sel_end);
+ 			highlight(new_sel_end + 2, vc_sel.end);
  	}
- 	else if (new_sel_end =3D=3D sel_end)
+ 	else if (new_sel_end =3D=3D vc_sel.end)
  	{
- 		if (new_sel_start < sel_start)	/* extend to left */
- 			highlight(new_sel_start, sel_start - 2);
+ 		if (new_sel_start < vc_sel.start) /* extend to left */
+ 			highlight(new_sel_start, vc_sel.start - 2);
  		else				/* contract from left */
- 			highlight(sel_start, new_sel_start - 2);
+ 			highlight(vc_sel.start, new_sel_start - 2);
  	}
  	else	/* some other case; start selection from scratch */
  	{
@@@ -311,15 -312,16 +310,15 @@@
  	if (!bp) {
  		printk(KERN_WARNING "selection: kmalloc() failed\n");
  		clear_selection();
 -		ret =3D -ENOMEM;
 -		goto unlock;
 +		return -ENOMEM;
  	}
- 	kfree(sel_buffer);
- 	sel_buffer =3D bp;
+ 	kfree(vc_sel.buffer);
+ 	vc_sel.buffer =3D bp;
 =20
  	obp =3D bp;
- 	for (i =3D sel_start; i <=3D sel_end; i +=3D 2) {
- 		c =3D sel_pos(i);
- 		if (use_unicode)
+ 	for (i =3D vc_sel.start; i <=3D vc_sel.end; i +=3D 2) {
+ 		c =3D sel_pos(i, unicode);
+ 		if (unicode)
  			bp +=3D store_utf8(c, bp);
  		else
  			*bp++ =3D c;
@@@ -335,21 -337,9 +334,21 @@@
  			obp =3D bp;
  		}
  	}
- 	sel_buffer_lth =3D bp - sel_buffer;
+ 	vc_sel.buf_len =3D bp - vc_sel.buffer;
 -unlock:
 +
 +	return ret;
 +}
 +
 +int set_selection_kernel(struct tiocl_selection *v, struct tty_struct *tt=
y)
 +{
 +	int ret;
 +
- 	mutex_lock(&sel_lock);
++	mutex_lock(&vc_sel.lock);
 +	console_lock();
 +	ret =3D __set_selection_kernel(v, tty);
 +	console_unlock();
- 	mutex_unlock(&sel_lock);
+ 	mutex_unlock(&vc_sel.lock);
 +
  	return ret;
  }
  EXPORT_SYMBOL_GPL(set_selection_kernel);

--Sig_/uxD.9kFF4kivyyCJeIpYqDh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5nDB0ACgkQAVBC80lX
0GyjgggAgS5X2HJDYySRmZBJLRrmO7SU9UJtv31JaGUDuCf270A16QvpOizLkASQ
fjw46jemXD2/U4yWZLjsZA+lOFYBysugN8dTcdM2oD3aYRYptuB9sOS5egYrMGRw
tLDCrOnrXBVvjdmbc/x5vyzBteNpeb+6QjFcjvpnYvTZAe35wMYeETzh5yMguRch
4FG4xkFugdU0h+GFWcFay/G46TKGjin4aRe2GV2espRYhw8+0Nc5j/4ilSW+dv3N
m2QyNKosKUg7Ss/Xvi9hXU3kqRTM8kmIRPaLh+TLJ5W9NDs78S0aUHW4rV5fnTAh
TVARIRzdKpO/9i3vXfUARX5EzJhAAQ==
=Qgud
-----END PGP SIGNATURE-----

--Sig_/uxD.9kFF4kivyyCJeIpYqDh--
