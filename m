Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495B93FBFE5
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhHaASs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhHaASr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 20:18:47 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9803FC06175F
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 17:17:53 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so701690pjr.1
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OGJJTJ4pfJxLw4S9aRxQPXAtKgFXW2ZX5tRlNEhDr5s=;
        b=tqvare1D5SAMcwfTVp7saS7Up5nHtzcmYRYiQrhJM2m6hzrvTXjAp315ad4Q9G1clU
         m/THEnkN9UeSe6ZiXkPnd4wUiLoq7HYB3QNd1weFa+r22pzOVPA63arQ/6wGETjGz0Qa
         9oG4qJu49jvt3UUen1VMMpIkN/yDszLy+esgBpSN/6KbMZgUI2VfTeAgmj5ZSAjhJneB
         cr7T0fhcmNQveKIVrjK2ponG5PLABXDkE+9nCm1NtFILHQmtkS8botTEdpkPI1aRP1t2
         p2r7i5/KVDLAfST4oZzJ4JS8acfPor/hHgz0ZydZRtCHTCOXNJ6M1XuZpS0vqnplNhJX
         A4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OGJJTJ4pfJxLw4S9aRxQPXAtKgFXW2ZX5tRlNEhDr5s=;
        b=lWo75M8JK0nafv1i2BJKQj3G/2+MLYw2/HwG1AP+6t+BAuyhcxXGH1QCpSykaP+PCT
         eW+uoutjpOuEkljBpLdF0K3uYrsQo4LNlAbBSK5EOZglcZat++iJHg5oeYQT/gk+EisS
         qJxCK6UiFU6J1NoHsCIdcJTLdN585L9vVaZ+W2meQollkgmhmncqWRpwTQUFQ/6D9PcB
         1383oVl7e7dOMKWlM4vEKQrebYtqBLTyt84Aw66W3UDgohUs5KJoiBLuIc9YA4sz5uWk
         178+/OmC2vNhrpMJvced9SF1TGH3uXf4miFej5NMs0SzCJox+kXrzZTFetM9SXW0+5ba
         Ti9g==
X-Gm-Message-State: AOAM5306mKrY3VlX6qoDD4+OHopajA2vvD90AScrt3j2jkS6vJ4zqOup
        fNe+SzG8njb188ByHrMAGVXoUA==
X-Google-Smtp-Source: ABdhPJykSlRmxQ1KMTTzx+annGmOTIgvOTyg7mo9hgBa64lmb3NBIbM8FSYMufg8vxPlyLFZqU0/tA==
X-Received: by 2002:a17:90b:78f:: with SMTP id l15mr1900905pjz.181.1630369072530;
        Mon, 30 Aug 2021 17:17:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d2dc:2a51:77c9:8407])
        by smtp.gmail.com with ESMTPSA id x75sm18948587pgx.43.2021.08.30.17.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 17:17:51 -0700 (PDT)
Date:   Mon, 30 Aug 2021 17:17:45 -0700
From:   Benson Leung <bleung@google.com>
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the chrome-platform tree
Message-ID: <YS11KS/XAGgTM5iQ@google.com>
References: <20210823152134.00d95cb4@canb.auug.org.au>
 <20210830172132.4fc0ae7f@elm.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PuQ4yxvuWe3Qnrk1"
Content-Disposition: inline
In-Reply-To: <20210830172132.4fc0ae7f@elm.ozlabs.ibm.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--PuQ4yxvuWe3Qnrk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Aug 30, 2021 at 05:21:32PM +1000, Stephen Rothwell wrote:
> > Introduced by commit
> >=20
> >   d453ceb6549a ("platform/chrome: sensorhub: Add trace events for sampl=
e")
>=20
> I am still seeing these warnings.
> --=20
> Cheers,
> Stephen Rothwell

I've just pushed this to chrome-platform's for-next:
  5a51bdb0ae26 ("platform/chrome: cros_ec_trace: Fix format warnings")

This should fix those warnings. Sorry for the long delay.


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--PuQ4yxvuWe3Qnrk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYS11KQAKCRBzbaomhzOw
wlNUAP9Ne4NwDaA8DqgKawSt6l73/9CQU2Piev5RXWPE18gfzAEAyN/0nYnwkq13
BYgueXKUQt6m5zeY29bGc9FHMBX6rgc=
=vTAa
-----END PGP SIGNATURE-----

--PuQ4yxvuWe3Qnrk1--
