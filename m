Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0B210AC8E
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2019 10:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfK0JZM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 04:25:12 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:47349 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfK0JZM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Nov 2019 04:25:12 -0500
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MWixU-1iKUGs1WKe-00X25Y; Wed, 27 Nov 2019 10:25:10 +0100
Received: by mail-qv1-f54.google.com with SMTP id d3so8562842qvs.11;
        Wed, 27 Nov 2019 01:25:10 -0800 (PST)
X-Gm-Message-State: APjAAAUgKq5FWCyA1C8yF9uuJ5z96wysgkeUuL5e/SoqGdJIG1VoW/uk
        wC6Bg0ikmSLhLaLiEmvTJ+yjFpIS3gVwu7iK3f0=
X-Google-Smtp-Source: APXvYqzs6+rOckuHAd+3aopwg1GeGgfWV2X9q12ELte4WZT5ZoownfduEHy1+6glfj3Mcw2cHjRqHovN97pt0V2+7oA=
X-Received: by 2002:a05:6214:811:: with SMTP id df17mr3679940qvb.197.1574846709178;
 Wed, 27 Nov 2019 01:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20191127130139.0b16375c@canb.auug.org.au>
In-Reply-To: <20191127130139.0b16375c@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Nov 2019 10:24:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ZitDAXj+4UWYQM+Vv6FvO+q7DAx6ZhBZU58NPH6MvaQ@mail.gmail.com>
Message-ID: <CAK8P3a3ZitDAXj+4UWYQM+Vv6FvO+q7DAx6ZhBZU58NPH6MvaQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <dima@arista.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WHbR4DI8Um5jgl17Wn1YLm4Xp7rPPGrftMB/Qo7sC3AY9rIg88c
 PouKIY4wxsYNbQob33G45NAq070NkFzRyORQr9+LvGp7NXaQdkbXFqU+XuoHwn6hcqwRMrA
 FWXauicOZXAi1ZosoKfqvVORqkrRSDZTySh2StywUiODm9aJHTwwPN3W8TaFrT7Bs+4jpnP
 aos9ZF54cqm92EtBaGb7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:haWH2gPHdQo=:roMz8QXqa5QqO6KZJVJ5Ia
 rz6wl1YcISIxI+PO0h4hzMarTi3s78ZJMhzsdwX9T55y/i8pqEgkvddFg1n5cBDQI56f4c61c
 TJOozFElDrgVQEm6M2Ci9aykzqM1VvyEmYK080vxjMWPN3Xqs5KVACbcerav5SSO/rksFZM8L
 IpKnThyz1S3c3kD+6YKuJOioF297idVRumL1wezVmCiOgYRPc8fRg/u7/6ob6PyO4obGrBc/c
 Bov/eqbesHqkAzNnQ1IJqv147GL7OFzAPUsz8fnbKUql965qiqWdRjlIwFjP7TPLk2SNqbUij
 ywOgUx5GeR6kvp+/FqealLVhKQ64wu5fa4eaqccH08ge5VUG9zhIWoNOTAu8HUwCi5sHwLSoC
 7yAYU43iB8ni4GoR2T1ouoXuvARs4ve9eupIaSU70HwfalEKDFH6HpCDzxnI9ysC+1OsGaSeP
 Q2xJtlIPpY1OPijcwVIx/I21V5+XQoH57o6UE3uF42yozf6yf6hKqo+C7rjn0v//PlFmJlqNz
 jLYlc7N4N9HbKebDvdfIT8Eb+eiAAKlrJ25GxiH/499HBoyD6o0i7tEH/ikR5YUuJMseiW7H1
 eupRUnm3/DHiRFcF+YKs2MpB+SEu4NMb95EU+kWXJF72dXAkURSWANbRlgiQsYVraTS1FivPW
 NG41ohbpuUSW4mLwc0HXsuIkmUWOqR0gTyCwgItUk7krVgEl0wFf5bk5IHXuYgv/fEYjA4uaw
 vynTJS7a2CUgv7/Mr0XhN6iWOxWzkXHtDhOq6+XGrDMbAbqldvxp4EvF1yo/ocJld9i9zHe8C
 Dx08ArsGjRzvDYqsP6BKhSFNvr5kcpwi7vZsH6jGufl4aG0Vx7LsFT5o1v/+1HpYnxZ4SN9XA
 61bB2w1NIt2lTrF6MRtQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 27, 2019 at 3:01 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the y2038 tree got a conflict in:
>
>   kernel/time/time.c
>
> between commit:
>
>   7b8474466ed9 ("time: Zero the upper 32-bits in __kernel_timespec on 32-bit")
>
> from the tip tree and commit:
>
>   3ca47e958a64 ("y2038: remove CONFIG_64BIT_TIME")
>
> from the y2038 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good, thanks!

       Arnd
