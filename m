Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5BE13D19F
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 02:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbgAPBlD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 20:41:03 -0500
Received: from ozlabs.org ([203.11.71.1]:43565 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729048AbgAPBlD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 20:41:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yn306yYJz9sPW;
        Thu, 16 Jan 2020 12:41:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579138861;
        bh=iF8dGjvO6kswMpy1JZRItoPj/hzZRrEEPqmUL5wGpiA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XimebBJCPS8AzMG/J5PAGPqz4AWIIePzkdVzN7XQvlpJqyFeOJXCsZIzlYm91uGJW
         z0AMRhNBn9tx23suVfpmMITvkFHpHHOmx/ZHkDs8LTkh8F1NWBTPSd0VdDdaTjEF2i
         yd/uSiCQXZ/SJOKitsX1sY3pUnfkcLdd7jyCrhxZ0SPq4BSzocCSq4QJ4xsNcx+HJB
         qhixqedNRRHWdXDtvC7NtNIpN39rn5LWUQPWVjOkL6B9FJDZ+10lpNu0SChbPZ42Tk
         dgHq1kOzY+WyI7VgF4Cb6aM+rekD5gv/3M6C4yxy48RirtzDLjFVtP5Xa6wvLUOKcq
         WZtYzbNRwJsuA==
Date:   Thu, 16 Jan 2020 12:41:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the usb-gadget tree
Message-ID: <20200116124100.58af81d5@canb.auug.org.au>
In-Reply-To: <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org>
References: <20200116070726.7e2ef8cc@canb.auug.org.au>
        <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jsW41eyiDVWTdreT2TM8+y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0jsW41eyiDVWTdreT2TM8+y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

On Thu, 16 Jan 2020 01:19:22 +0000 Bryan O'Donoghue <bryan.odonoghue@linaro=
.org> wrote:
>
> How should extra long fixes like this be divided up ?

Just let them run on even if they are too long i.e. don't split them at all.

--=20
Cheers,
Stephen Rothwell

--Sig_/0jsW41eyiDVWTdreT2TM8+y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fvywACgkQAVBC80lX
0GxLkgf/b0A+nGrggj9HA9czdShu5o3SQFdD46v4dtIOSJL5Ix4DaTqGH/lST817
7IDySPHCs6gilXop6l6ZzVbw6gFQ47xGMn34WCrGQDthLM3D14yZoQp79VzQCE9m
rp0uilwLyMzPRjX9D68RBZRBmeSr4BhZ0TCHjrpUnEGuHiVfCKCOBXbeCJdFT6Wy
1JKwGYrh+ScFYq/XBkvYIasXIuH5aKdObvHKDE9VnXcyuzc/n0oMaC2HSiBaXC/z
6CIeAxSiPRrtV9DeWkVx0vUCjULV/FdXRNTkEDvam7wfiFqOmILfQh/FVfoBTGTR
vYSMijraYROwIyiFwv6MnQNI0aU6hA==
=TWxy
-----END PGP SIGNATURE-----

--Sig_/0jsW41eyiDVWTdreT2TM8+y--
