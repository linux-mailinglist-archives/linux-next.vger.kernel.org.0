Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9ED5184A4
	for <lists+linux-next@lfdr.de>; Tue,  3 May 2022 14:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbiECNAw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 09:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiECNAv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 09:00:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B090A3464B
        for <linux-next@vger.kernel.org>; Tue,  3 May 2022 05:57:19 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v12so23218900wrv.10
        for <linux-next@vger.kernel.org>; Tue, 03 May 2022 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=7TOGHcHekaFO7f+j1SO70Y08InL8fjzFxY4wwxiSXjw=;
        b=WZNnFAlWBEChTl7JJwhHsz0KIWVztdcwcPGm6WtEO7sSYLYRvuiE7XVmbxki9Lxl9t
         J1gw1g3JkLrQtCweng0CkMSvcGoXhJcrrzGgTmz0LnRyp9ljMtpHfBt8wzlU5Aid9WSd
         rQT+TNxTVD5BrJXxGvX6gZf48cAJl9wTNNPWTJM8XlWDYg9AWHWVKRBZeSuzmQjMKkrU
         gHmf7WMRvccxjrDildUwjEJ9IYvlSmpytp1yjBOwnx3D6hhiuB6g83cAuebbwtlpWocp
         FCBRCalzX//G6xI3Hf3CrpFInT35v3OyKqz9h7nAlMoWYMSwcNn0BqbRt2TedoCKracH
         g6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=7TOGHcHekaFO7f+j1SO70Y08InL8fjzFxY4wwxiSXjw=;
        b=hiSPvMp/+VgJI1JrYgiFQykVfFZdDOy6RNof+Hl3jQPcZK5zGaYceFYJrjXfpZBTZc
         +icAsWuNxfKFOieOxZBdFG121zU/z8U9qwPyHKWFmJ5p3ZMKuXgr4yVW65bCBG+p2bYe
         7468l84XMy+15yT2F1I4M6KN4lpHmvztSwdSHHiIdlqyJx1leG/ME1Bdga6GM3H4hwaf
         kdv654F7eZbds/Rht4HMfSONdShelmHLlnxaxSAk/gaPPuib5abcLssm0OmlEespoDuE
         jui/Pnrj8qlIKr5XbWv+wM3O/tOSWSAoJYcRLjmDUnzB5TOqinQotDnpdKJy57BeXAKC
         eciw==
X-Gm-Message-State: AOAM532phu/2PB7WIR7QsAMYBm9tDzoro8QYuT4LOmKGV3lHTwBDEX8S
        TNgIb5woNMvJwrcNWAiAAY4st3vhfrg=
X-Google-Smtp-Source: ABdhPJyACMAxlwOUexEGUv4JG0sbXOKH/dNSDovFdslBk135KLi8SAffI19mcarc1+dSpUbWBQ3Bhg==
X-Received: by 2002:a5d:4dd1:0:b0:20a:d74d:e33b with SMTP id f17-20020a5d4dd1000000b0020ad74de33bmr12265185wru.222.1651582638131;
        Tue, 03 May 2022 05:57:18 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c205500b00394517e7d98sm1112346wmg.25.2022.05.03.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 05:57:16 -0700 (PDT)
Date:   Tue, 3 May 2022 14:57:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-next@vger.kernel.org
Subject: HTE tree for linux-next
Message-ID: <YnEmqsfZu7uWsm8s@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QeghdRDFK1YNlpjx"
Content-Disposition: inline
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--QeghdRDFK1YNlpjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Dipen has been working on a new subsystem for hardware timestamping and
Linus Walleij suggested to put it in linux-next to give it a bit of soak
time before we propose it for inclusion in mainline.

To simplify things, I've pushed a branch with the patches to the Tegra
repository for now, but longer term the plan is to get Dipen set up with
the necessary keys to maintain this in a separate tree.

	git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git#hte/for-next

Can you add this to the list of trees for linux-next?

Thanks,
Thierry

--QeghdRDFK1YNlpjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJxJqgACgkQ3SOs138+
s6H5uw//YLegKG4VX/M0LHEmFbT0Kn5WEhRITK/2nAuln6wfL654wPwul+35LBqu
Kl7jGFu9glbMjYaLxnAMHo0Q2K7YRVP2T0nH1vcx0KmZC0bMEFcSv03p0G65Vb6Y
PLo+cQcAUmviw3XHPiQhYknCTmazTqOWsfjK8IWZdFsTZB1x/V2m+nZXI1ZRYNNz
Mt1rHabzz7ddt2jh0J9ApTcXGSDO7thlvso30+knzUxpN3MclAYyUddLnXo1dI4N
1eb5FPuLOMOIBhZO+kVQ2XnYz+pvoUu98NWfJJlHKkH2IifV9LsX1i5EQPqussLU
rY/YkLFvUWIElm3Aqo0HWNt5qEkZYdndnMVinOs1drdGUU4SAtv038ZDZPh7SDHS
IBZPdP/cj/Yw2hOf8gQJecVnXdSVAdImHASh0QT32rMkcyU+2t3+y1UnyWi1PfLJ
csuwafjbbR1cugbKhqNOnwaD3xlyKn5qBrj6EenAE3WCbf0mgHAYLEXbPfAib1W7
tQ/EWN1diDiNwQJOhGOppCyKh42h7fupmAaL8RvS6vSpW1WOoRWZIbgBeCHGwnO9
6r7oI0jj8SfqCPpcWmcbtNn+JZYwHUAZz9pbt09WjX/ItVpREc/CP48bT85fFMHn
BamdckIZ7enWZzsrVUs9wsYhq0dMKDaJPUgXB3qCbp9hrc36yeI=
=JVOp
-----END PGP SIGNATURE-----

--QeghdRDFK1YNlpjx--
