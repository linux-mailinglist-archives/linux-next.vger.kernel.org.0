Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029553E58C5
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 13:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbhHJLBy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 07:01:54 -0400
Received: from ozlabs.org ([203.11.71.1]:59453 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237696AbhHJLBx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 07:01:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkVPk1rwtz9sPf;
        Tue, 10 Aug 2021 21:01:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628593290;
        bh=PV8t0TZ5ql9h4i0Y2UfDgJsM8SqK46a+vA4DaRfsqGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tFLY2aqcVB6qSI4sdKlOA4xMBveZfY92211pGxur6zkGEsTjOwRqUokQhS+WLaKey
         wTAeyRLjF7GOBV9BOh9wCrS3RYHeT+Mi99Ip326hwoqs60eX+gbYeXfeDABkofX5Vw
         l9S/kyUVq/CsZ4ayYyK/fjneN9DOwaHaJSMg19YUlboghOPD9kgqf2FS6i71PpZL7f
         oVMAIjF5mrCH6zIUaiId+pou5G6RQ/VjBJN/GUS9M8gOp+IrcbvzRKAOqYL3gP35mW
         NLcQ4LN0e8iY4aFf09ABdveyMcpYFP9ATTKDHOhbna8BwKBcXGhmU6/PyUBmhrLcDM
         kULWVmN5UCCNA==
Date:   Tue, 10 Aug 2021 21:01:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210810210129.03b3fba5@canb.auug.org.au>
In-Reply-To: <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
References: <20210603193242.1ce99344@canb.auug.org.au>
        <20210708122048.534c1c4d@canb.auug.org.au>
        <20210810192636.625220ae@canb.auug.org.au>
        <YRJRju/zo5YiF1EB@phenom.ffwll.local>
        <20210810203859.128649fc@canb.auug.org.au>
        <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Szv79rulu_bIgTKLQCfYG+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Szv79rulu_bIgTKLQCfYG+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 10 Aug 2021 12:50:55 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Uh that's not good, I missed that. I'll look into it.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/8Szv79rulu_bIgTKLQCfYG+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESXIkACgkQAVBC80lX
0GwwAQf+LFFyrulc1CxIApGdjUHFdTPOzQSnEdDZBOnPFAego3E9kEMhqsq7DYZM
cgkiLKoStliz5dgUXQZkqbKN5SCw36+yjUr2euDQgwkif3LmvoXomn3RlJCQLKbi
edYJRcTHmoC0CRwTyZt4/w9nLcQyfJVC5rNtQLVWWvt1mHWw6CC/nV4g/SE+rfhb
UgeJ8Z5zdRQpz25bk5VPxtNsxoyAFkIx6WIDoDc8dOfufzjAB8ezhOokkpY/54xj
I9cyZvZXJe4GhgFyYb0L48MxYrDJBl+L4AZ61kvzs4Osiok6cJm8zEU+FDZJt9Qg
1Sf0dXJuwph4nbxCU/0WLYGHg5cBxw==
=CC8W
-----END PGP SIGNATURE-----

--Sig_/8Szv79rulu_bIgTKLQCfYG+--
