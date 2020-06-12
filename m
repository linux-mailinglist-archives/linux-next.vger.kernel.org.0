Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968CA1F72B9
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 06:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgFLEKn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 00:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgFLEKm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2020 00:10:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E68C03E96F;
        Thu, 11 Jun 2020 21:10:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jnMK0FQPz9sRK;
        Fri, 12 Jun 2020 14:10:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591935037;
        bh=6AG8GvqvU6DPviqQYHoomkPDaOuyUZUevkG3PA84K8I=;
        h=Date:From:To:Cc:Subject:From;
        b=MCD22TcauqCR6HQEgEJs5PcGC1jXwTSRqs2RNnT9V4UUxaUwvB6UzFRHRRGvuNhS9
         JdEZH2rQPHcVJ6k1okA2xYDM5HnM3cqmAMjVKr6/o/93a5q1il/860TyblNSV4Ve8X
         29TYCuxaaMPhp/gtznV7j5xrbcxMmtR+PnAL846C2uw9+g9LV7SXZPO7ciHjsxZLy+
         3NFutji6P99M4DzRRPHFUXkV2hzRbT0f3Kc6ci0OoO5sJDMJzcQ48HAls7QHOXmvl7
         AWb/9U1bILSORZL/nXqQ0IbGILRXUwVKxHLRWi5UpIyRFLfEYv/i0iiz/u/5Ex8wT+
         30jtefPm7n5iA==
Date:   Fri, 12 Jun 2020 14:10:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20200612141036.6c4ddb37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7M8F3Lr0aG2jdnH4Y_9+7SF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7M8F3Lr0aG2jdnH4Y_9+7SF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5fddd4f5db87 ("drm/msm/dpu: request for display color blocks based on hw =
catalog entry")

Fixes tag

  Fixes: e47616df008b ("drm/msm/dpu: add support for color processing

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not truncate Fixes tags or split them over more than one line.

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks =
in dpu driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/7M8F3Lr0aG2jdnH4Y_9+7SF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7jADwACgkQAVBC80lX
0GxHlwf+J2HsvWQw3J32unJpEtijoTzYtE9sAvubWDHMO+AMLJyfijxY5dBdvz63
X1z9ZYa79gRmkGcHKTMfJ5FuSXgm7pXLf+z+CrzbdZfgdMaDc/Q78pvJYPhSccF0
fvp9akWReMz6TSpCiLIfrbN95A+chVVpspNMr8NDrqsVTKgBpxvlMdNwyKxnLvxj
MLhzAec6n1ibYhYK9C8+Vfi2vf27rsp6hbcil7LD88t90dBcCSi6kBZpnXSjwNdr
tBlWHZb/KC/BoIF27RRT/45zOybFO024GG5u2kY7g4BpOWgvD5eAX4Lga9sYQbSQ
TPHVbFL03VgJ6izsXgmlJrf33LgC2A==
=Pl8l
-----END PGP SIGNATURE-----

--Sig_/7M8F3Lr0aG2jdnH4Y_9+7SF--
