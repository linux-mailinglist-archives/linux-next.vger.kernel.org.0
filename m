Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707EF4C7DAE
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 23:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiB1Wr0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 17:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbiB1Wr0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 17:47:26 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19EC13C3A6
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 14:46:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6wVF1zTGz4xcS;
        Tue,  1 Mar 2022 09:46:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1646088405;
        bh=SpMjOsM+mhTtm55804MjqbvZzq/Q20YPASZpXQHAclQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W94kpPf4nuBPGiigRNjt3ENZwMNoHfLCWgM8F2/shrR4v7l39G5uADG/EClqHrm+U
         1hashMaH/lksVm7fAhCKYv2jzMpnWUfNtibiEDKNWaha4o6XYeR/WQuI+EjyQvrkU6
         xnGK+YLOIsVWMOuzm4YGJFxO1U4wluUEiRuZ8bZIAUOM4NmeLGEmGBFrTvQq8Bz2vO
         Itn25JPm3CBuAEnn63o5oRrsX3ugaTAlOgoeSphXh3kAZK6hRO+JMgPf7TTTp74Wj4
         yNYslCWesOahp6lZKO4u1w9+xiCSvia98X8tMGDw3uqoRl0BgqJEXj1L/r53XyIk00
         EKgTFQmwk7JYQ==
Date:   Tue, 1 Mar 2022 09:46:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: change to Next/SHA1s ?
Message-ID: <20220301094644.58360917@canb.auug.org.au>
In-Reply-To: <202202281042.733E768F@keescook>
References: <202202281042.733E768F@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XYEZ23_BJ3Zr46Xx5Nif_5F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XYEZ23_BJ3Zr46Xx5Nif_5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Mon, 28 Feb 2022 10:43:37 -0800 Kees Cook <keescook@chromium.org> wrote:
>
> I was curious if it might be possible to emit the commit date along with
> the tree/SHA1 map in Next/SHA1s? That would let people trivially scan
> the file for relative age of trees, etc.

Of course it is possible :-)  Just wondering what the use case is?  It
does make it a bit harder to read (wider lines).

while read tree sha; do
	if [ "$tree" =3D 'Name' ] || [ "$tree" =3D '----' ]; then
		printf '%s\t%s\n' "$tree" "$sha"
	else
		git log -1 --date=3Diso-strict-local --pretty=3D"$tree	$sha %cd" "$sha"
	fi
done <Next/SHA1s

--=20
Cheers,
Stephen Rothwell

--Sig_/XYEZ23_BJ3Zr46Xx5Nif_5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIdUNQACgkQAVBC80lX
0GzvSwf/TCjIKoVGHKgHis70zfyAb30+FvewfuVQD9EbFE+itbbxSoq4EGyS84fm
YE3eZ9U/xzTpLd9SxgDFFOtPKICghzD/GdV64V/mrzKkxqEzigD3Rcipv6B/F0U/
W/T7hog2tOW8ReeBOmgD/mBS2MqMVlFnHg+den3ZkBgkaYhHZfHXvM/3xAPWV23I
rO8U/5sJt8MBJfWjvK4VipvlLu77UesvLxYi/LOAWNAH+8ZyRyGQIuKYUX/DUsA0
3XhMeaFQGPWkwts3u3HOhz2bMiVW6yzmtfUZsSWfMQAH6KI1ZzJLvzAR36dWGb1y
rWx0uY9xVpvPkSRYEgQ9s1309AafuQ==
=72AM
-----END PGP SIGNATURE-----

--Sig_/XYEZ23_BJ3Zr46Xx5Nif_5F--
