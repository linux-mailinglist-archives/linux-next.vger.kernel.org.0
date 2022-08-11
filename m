Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCB058FA8C
	for <lists+linux-next@lfdr.de>; Thu, 11 Aug 2022 12:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbiHKKPX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Aug 2022 06:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiHKKPW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2022 06:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99C1F17ABD
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660212920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AFT37D04zq4LQqw9OKWRNkU7ORSqHvfNUHywXUhX6hQ=;
        b=iyjUGf9+9OPy4Uh8TAgky1YkuaUcKY/qz8sV4BK//P067bGV1Zt1HUz3w/jpyqo2VM6iKn
        pPRlGAe/Z/k1IRqpMN/goYRrctwZCDYuGFNwVTZelodofi9DXT5umfUJCJDiVrvYtE7i8b
        fePCkis9Eb7lUP6k9BH5XXCavmODjik=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-DtfPjtTtOO-LOlxLW3UDnQ-1; Thu, 11 Aug 2022 06:15:19 -0400
X-MC-Unique: DtfPjtTtOO-LOlxLW3UDnQ-1
Received: by mail-lf1-f69.google.com with SMTP id o4-20020ac25e24000000b0048af174d5bdso3791159lfg.9
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 03:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=AFT37D04zq4LQqw9OKWRNkU7ORSqHvfNUHywXUhX6hQ=;
        b=u9/1e3eSxU7aXPJHUayqfxlj1KCm4RheGmkTAY1XXnqjTPW5pvB4jbe6shoWJl0HZg
         r5x8pYMSO9GhslX+tt9Shjy3AHhqd0L3lE3FN+w87jAHlGGAbpN08UpRqoll0hZzvfaE
         QnqTb2kKLbg7+AT2rKJBz3f6wcZSbRlTDkwkAizFWG4wqrkU7X3IpC2Rmget3wPJOGn2
         tTTfNDvxyTVF6F8l0wc5cBkt+cVr08YmtZz0V0GkJ8OBCFZatNttTpWQYcpaO5FxXi7y
         2TAAQku6T6+VMT3aZ2OD2eP+MZeL1XHmbIcucGVHtL/54alfYn/dc/rEV0sRLxZlnuTC
         8RgQ==
X-Gm-Message-State: ACgBeo3ZY9KZ9+nbo3cPXOKOmXiNg5PYGZJtQ0JVdcYMA/lQ7nt6kniw
        p6VVsAsHPLVE22g4f2ad1soxjHdhixKEyNO9shpXYsHYiHLnS31XJY4IzOBUQZsBdMrwXz32f9U
        taLSaKfFGCYTWgyyjPDhDuv/KOdxmd/AemH92xg==
X-Received: by 2002:a05:6512:1189:b0:48b:26d2:b13e with SMTP id g9-20020a056512118900b0048b26d2b13emr11289028lfr.37.1660212918020;
        Thu, 11 Aug 2022 03:15:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jTPZzSZ4GMRnzcrTCRiqnNxYHvFdJA9ad1ZTevfiXyMPLqL0jmSkWGRT5NKQispK9XZF0wtoPDIyXonqfH/Q=
X-Received: by 2002:a05:6512:1189:b0:48b:26d2:b13e with SMTP id
 g9-20020a056512118900b0048b26d2b13emr11289020lfr.37.1660212917822; Thu, 11
 Aug 2022 03:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
In-Reply-To: <A330513B-21C9-44D2-BA02-853327FC16CE@linux.ibm.com>
From:   Stefano Garzarella <sgarzare@redhat.com>
Date:   Thu, 11 Aug 2022 12:15:06 +0200
Message-ID: <CAGxU2F5V-qxurLSZhugvNLWkiDOM83tgKQrEUFB_PLd7=kTH3Q@mail.gmail.com>
Subject: Re: [5.19.0-next-20220811] Build failure drivers/vdpa
To:     Sachin Sant <sachinp@linux.ibm.com>
Cc:     kvm@vger.kernel.org, linux-next@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 11, 2022 at 12:06 PM Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> 5.19.0-next-20220811 linux-next fails to build on IBM Power with
> following error:
>
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c: In function 'vdpasim_blk_handle_req=
':
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: a label can only be pa=
rt of a statement and a declaration is not a statement
>    struct virtio_blk_discard_write_zeroes range;
>    ^~~~~~
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:3: error: expected expression be=
fore 'u32'
>    u32 num_sectors, flags;
>    ^~~
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: error: 'num_sectors' undeclar=
ed (first use in this function); did you mean 'bio_sectors'?
>    num_sectors =3D vdpasim32_to_cpu(vdpasim, range.num_sectors);
>    ^~~~~~~~~~~
>    bio_sectors
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:3: note: each undeclared identif=
ier is reported only once for each function it appears in
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:3: error: 'flags' undeclared (fi=
rst use in this function); did you mean 'class'?
>    flags =3D vdpasim32_to_cpu(vdpasim, range.flags);
>    ^~~~~
>    class
> make[3]: *** [scripts/Makefile.build:250: drivers/vdpa/vdpa_sim/vdpa_sim_=
blk.o] Error 1
> make[2]: *** [scripts/Makefile.build:525: drivers/vdpa/vdpa_sim] Error 2
> make[1]: *** [scripts/Makefile.build:525: drivers/vdpa] Error 2
> make[1]: *** Waiting for unfinished jobs=E2=80=A6.
>
> Git bisect points to the following patch
>
> commit d79b32c2e4a4e66d5678410cd45815c1c2375196
> Date:   Wed Aug 10 11:43:47 2022 +0200
>     vdpa_sim_blk: add support for discard and write-zeroes
>

Thanks for the report, I already re-sent a new series with that patch fixed=
:
https://lore.kernel.org/virtualization/20220811083632.77525-1-sgarzare@redh=
at.com/T/#t

And it looks like it's already in Michael's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next

Thanks,
Stefano

