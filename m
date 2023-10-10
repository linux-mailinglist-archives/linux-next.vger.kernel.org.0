Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2BF7C4158
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 22:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjJJUjQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 16:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjJJUjP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 16:39:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1588E
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1696970348;
        bh=Mz0vfLHTcnfl7yjEmKHj1/Q/9qSuC3ss7DGB0boufcc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iKmVF0NbpcDgyHwDRKxkis6mjCZPjsjJZD+RucL26OBpv4SDE+yG9vwHftJUgqj3L
         pD42mIzchqAIweUqBQYtJ03dTaKCLdH1FqKT9GAGufJAjgPNFMMTJME8ILcvj7Gn9Y
         n2ddaiq4d+qM5l5TrMtju/HHr65LlwpkSOZ2ftlGE74hL+TAVGPXIeIn3LLPKlfXL5
         xeUreQh/yUIqcv9HpUjIjmOYw4h+gSgZ3DUAy2hwU7+s/ZPjvpfcMMkZSYmL70LnqP
         OUXHLqIJdax68T9oL4Xw6Up23FbyXvS6bDneKT4ucLMmsX9najuJ46qdm8ZzR5irEk
         q6AGyvFXKnOzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4nn82qrpz4xQg;
        Wed, 11 Oct 2023 07:39:08 +1100 (AEDT)
Date:   Wed, 11 Oct 2023 07:39:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        linux-next@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Upcoming merge conflict docs/powerpc
Message-ID: <20231011073907.7567ab89@canb.auug.org.au>
In-Reply-To: <87o7h65l13.fsf@meer.lwn.net>
References: <87o7h65l13.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GJUi/8IWuV+aEWPY86+6u6U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GJUi/8IWuV+aEWPY86+6u6U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Tue, 10 Oct 2023 13:34:32 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> Just a note to say that the move of the powerpc docs under
> Documentation/arch showing up in in docs-next shortly adds a conflict
> with the powerpc tree, which adds a new file (kvm-nested.rst) to the old
> directory.  The fix is just to add it in the new location.

Thanks, will do.

--=20
Cheers,
Stephen Rothwell

--Sig_/GJUi/8IWuV+aEWPY86+6u6U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUltmsACgkQAVBC80lX
0GxvbwgAoAT3MPjKxLxJwQL7/8j9oRusUtA4iY3VzmpIhFaG6I1iVAjaSsxz7/ps
whjL2Spu8ILyrP3PYWfl7Ac5EROiNLVPusnddGAJ2Z9ga0RTaoB5HoUdemRnM6Ni
e2X8ZmK7p3EVN67hMClp4MThQjp7QfKygcP1GIgelsHwWzxRE0he2RNKt+vi0sex
LcLXexk6/aNtzp/X5QLDm01ausgD8NzX6t5eHDyeb5U+Zk4dR/Yh1DMXdiIGpSwc
Og5+UtEbBonFX1CctkEH82oXVlrcWobvMY8a4Z7bR3D+A9PkU9AJTPE8VXqLWAR7
arh5YeJXzPxIx5h8qbGkywXXOz2+wg==
=jb/P
-----END PGP SIGNATURE-----

--Sig_/GJUi/8IWuV+aEWPY86+6u6U--
