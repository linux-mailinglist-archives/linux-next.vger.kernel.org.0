Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA183DDCCA
	for <lists+linux-next@lfdr.de>; Mon,  2 Aug 2021 17:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhHBPtW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 11:49:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235374AbhHBPtB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 11:49:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88C36610FB;
        Mon,  2 Aug 2021 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627919332;
        bh=/oCmfcGrQAmFx1W8R27Lyovp/i6hZiYv1kKsPSGL6SE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BmUc15QeO4nlCy9PmcJA0udAkJrcK8xboBOEuwvNV5iqLGiMW9UyElhtpl+vfzhnI
         k4c13dlB+zqiiEq3usEOiuDtr8NN30uGDHOe9sfgh0kQo0rLahsA9VRn753Qxowv+j
         vys7JP5w8GtfeWWyw51kXX25L5VibpEvrUcvs5TkLZk21Y9evqwgqGa9vzIzxyaAC7
         3MdWuK5Go0hzh9BFRBdWp23xMhIwSH6AEjmmlF2+UijCumFmGuLOl7v90OzLJtCffZ
         AoaHCKn3uUk2UpRgM9na4Ei4f0abgFECdXwxi5zxiz17acOyBprqa2oBYuJ3HJhUiq
         dAzUCOpO2HSFg==
Date:   Mon, 2 Aug 2021 16:48:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Huang <JinhuiEric.Huang@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210802154838.GG4668@sirena.org.uk>
References: <20210802151053.14982-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline
In-Reply-To: <20210802151053.14982-1-broonie@kernel.org>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 02, 2021 at 04:10:53PM +0100, Mark Brown wrote:
> + 	if (dev->device_info->asic_family == CHIP_ALDEBARAN) {
> + 		err = amdgpu_amdkfd_gpuvm_sync_memory(dev->kgd,
> + 				(struct kgd_mem *) mem, true);
> + 		if (err) {
> + 			pr_debug("Sync memory failed, wait interrupted by user signal\n");
> + 			goto sync_memory_failed;

Ugh, no.  This is broken because that label is gone.  I'll stack some
more fixups on.

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEIE9UACgkQJNaLcl1U
h9BRKwf/TOYnEpnuc/Vrs+1IMbNAhqu6g7a6epGr7jUD4rrA1OI6lJ/Z/9/e0y74
sNQrEqCMtuqEwUGcJJJYSxNtu0ZNkleR8IbVvu1k5WtHo/Y3A28LEIwPefvgTzYG
DkPrQ1RKZdYDijwpK+9ZHdI2xYhkQ9vN6c2ZLVVuQyiLoXgvqEESXOpaYvLzOVVn
iu2oewlU4PjA8nKkY2//Xjgljdq/3nnr9M73xVdqBc9p1symjzKO9Uma5G8hfVU4
+pft8FO9igKwVDo8ZUJkGSqzpJqWA5Kr8RWCDMhP0RlU+bdaxtftSa0/jZGJ10Dn
KqYl+tfp7hKbQ/B/FeNmCE42JXs2Jw==
=1LgJ
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
