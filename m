Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E41149E0F
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 01:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgA0AyH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jan 2020 19:54:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbgA0AyH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Jan 2020 19:54:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 485WTm6mPlz9sR1;
        Mon, 27 Jan 2020 11:54:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580086445;
        bh=JXBzMRZ/+AdlggAxZFJEkq9AL0uC+PLRgn9c+hwwn7c=;
        h=Date:From:To:Cc:Subject:From;
        b=aa6V4/PgcE3kaVAClHmkmSw/jwU+teM7K/H/Gohg7jwgH9YuBj1O0GJTIl47fjkQT
         3tRzsh5G1WBpHctVo3m546GD0f3pNqQ6EAQxJoRX0TtkTyhl2sHQms5fstloXPTMsR
         OTtSeDakowl76d+j8XRzqP6Zoe7kYITstRSAwMo0lyWhILc8k81EIZ7unAVYQHeISE
         pJIY2U9rw4imq+zm527TmNeFiM8VwJbj9YqkaBI2xojJLOXb3MYwPl5WePF/z/Zps0
         QBCMi36E66vOx2usZJQNEWjt8UNLrm4kBAI7tzixiv9wot8OHZuVJcp4FrqBvBaq1s
         SzZ5W7JI6TBrg==
Date:   Mon, 27 Jan 2020 11:54:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: No release today
Message-ID: <20200127115401.48e1e3b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zVeBr4nTb6fpKu1XPjkgG_R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zVeBr4nTb6fpKu1XPjkgG_R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release today.

--=20
Cheers,
Stephen Rothwell

--Sig_/zVeBr4nTb6fpKu1XPjkgG_R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4uNKkACgkQAVBC80lX
0GwPmAf7BQydlbwHx95WXWuot175/muVByLUG6D40MPrx7Ivm9pLxfEEfbQB3q50
9//5UJ/AMKfoyWRy2J8lxNICZ5aIDtJISHOYJaHJnQaSRnHuJm1KAd0geK7ochEG
LfX297bReVnayq3VyOdDWOxw1P7OB3Kw5BE9TUkRb3WHFjckrZrlgbpcM6K2jQ8T
1+WHxkk6kZ1vexJycNrelHn7Xh6yK6xbJOT1x5wnFNePbiB+QDb1RXDDzniD9bms
hsD/Nc4ZXQSn4pXIHd7uWj6kXejyIwJCbpnudXe89x2V/v0I0hpMXSR4bV+tirSO
Jw8m5CS2UziTdnAyS8BxIzj5iPzdjA==
=xNQv
-----END PGP SIGNATURE-----

--Sig_/zVeBr4nTb6fpKu1XPjkgG_R--
