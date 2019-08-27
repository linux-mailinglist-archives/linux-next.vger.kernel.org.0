Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D229EF2D
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 17:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfH0Pl4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 11:41:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44286 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfH0Plz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2019 11:41:55 -0400
Received: by mail-wr1-f65.google.com with SMTP id p17so19289639wrf.11;
        Tue, 27 Aug 2019 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bxn2QHPQaoLTHaLh1S1+V6Gu5XpRhaWezO35cut4r8Q=;
        b=m0wMJypz/tc4k1Ou0Ldau4jp2J1H1jOI6WoNCDkVdCxF+Csdl+8WkWLs44l9DRZkMf
         acBefESXpA/28xRsiFZaLkb3/N2Qi3agh+kqbWzy73VABGuQrT74ouU+JHsx66g6yzZG
         LSZqOkiezFpiNNpAh/gIg291QBhVNaAVfiagkbNiPmgq7ZO3YbqkAEtU05bI1AmZ9Cr/
         Aq/0YkrProxOmI9BPqvo8AKQhVWTOHYyTcyEyOe+YnLGYbgrMJdwhnPCGlsIB4oeP4kG
         EJT0QMPMWeEzoeqDjFEAfp/MKtz6URt/q6+jUAcBxNkQ0huvjplA4cGEi9SZf5lBJKpC
         pTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bxn2QHPQaoLTHaLh1S1+V6Gu5XpRhaWezO35cut4r8Q=;
        b=T0FB7/c5kLkucDc14TAKd2Qc1Z9DMXq/bM3uQ4U5VWIsmzmfNWGHrPXkkAYODsYbYT
         +21pgv+3owk++rPWnGwjCVoaJmH0R7jecS5qF0pY1dIj+pV3itIxu8WjWOPOkCgA8IAg
         rbg793BVsCaAqT2JF/2ijRaNeP3NPJYl2EWupfxsQ6CxT2ayX2RAopih4fEfkqyG8h6G
         pNMjBywYYrUpZLYL5msJrKAMEE2R3nVVtes3xJ8YRS2GlBua5tbUhPg8dx84ASdPQNLr
         6Wgz6JPyxBf/nM3xmwQvHpOP0LQDzf4Hp3WR/4Z4m/oXgHjQTJPEVWV7knu+iCunKX37
         1yQQ==
X-Gm-Message-State: APjAAAWkRxmk2FFwl/YWqpqpP5B4kNmPCLvDqMBGOzhZa5kd/uyJwnec
        V4QXR+Gnuqt0BQBa/L0P2m2nWLhypEm/0zsGU77tWQuoIPA=
X-Google-Smtp-Source: APXvYqwKyiFqrPlh5yDoI88FFfW2D35INgtoq/jJAH8Hvv3vnTy27JdzrBLkWuV/hqW+iv91wYtkEr18W0/Cd+GtVG4=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr8239699wrc.4.1566920513497;
 Tue, 27 Aug 2019 08:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190827190526.6f27e763@canb.auug.org.au> <3b5936f1-e471-846a-d133-0e17d290d2f3@infradead.org>
In-Reply-To: <3b5936f1-e471-846a-d133-0e17d290d2f3@infradead.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 27 Aug 2019 11:41:41 -0400
Message-ID: <CADnq5_NBnovQGuhsoEsw+S-LBDU-CbWXKm=mJ3Oy6PcgUeiOQw@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 27 (amdgpu)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 27, 2019 at 11:31 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> On 8/27/19 2:05 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190826:
> >
>
> on i386:
>
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c: In funct=
ion =E2=80=98dcn20_hw_sequencer_construct=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:2127:28: =
error: =E2=80=98dcn20_dsc_pg_control=E2=80=99 undeclared (first use in this=
 function); did you mean =E2=80=98dcn20_dpp_pg_control=E2=80=99?
>   dc->hwss.dsc_pg_control =3D dcn20_dsc_pg_control;
>                             ^~~~~~~~~~~~~~~~~~~~
>                             dcn20_dpp_pg_control
>
>
> Full randconfig file is attached.

Fixed:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Ddrm-next&id=3Dda26ded=
3b2fff646d28559004195abe353bce49b

Alex

>
> --
> ~Randy
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
