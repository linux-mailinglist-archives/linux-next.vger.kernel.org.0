Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72ABA13A320
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 09:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgANImL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 03:42:11 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39093 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgANImL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 03:42:11 -0500
Received: by mail-ot1-f66.google.com with SMTP id 77so11854852oty.6;
        Tue, 14 Jan 2020 00:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T8qOAMy0UIqL+2eVFMgbKLOWTgbr4olC4h9PpEXhBEs=;
        b=Y73pDsuMjCzY/mlgZ8Oa51uUqlcAHqdE6fDWz/GjAOclq4BImQqY+pFD5QFtAxrjuM
         Nxa1ARGsEQT+oFy/CS8NTob4TT+j/vrD4H2B2uA5s3D+J0DV+pYR3u5/dvO+XtUSZxl2
         p/1kHUqNnJzbvGeSijGWPtx4XvBdTgglYZdIlAnH1L6DRhaWpNzFQ5r8LXGx3jrSBj3a
         CEntHaCo1f+3bRIkUNSNjALchCngi3K1xak5LW8ZloC2b6VWnSEx22J+2ggLhGPFqZcO
         zDacjCaHURvGOSY54dfTg+Hdw03XG7zlKjgQeeB4zeMYQ0QBhpSHvC+HbhOijCmo0d2+
         82hQ==
X-Gm-Message-State: APjAAAVFIdIIEfGNY8G9vml43MAIdr4XGiGWrtFzuWxooruaghoyuCoZ
        67Pu2o4LXVhkRRwdwP/csm6+p257t5P4H7dgK8U=
X-Google-Smtp-Source: APXvYqxUCQecu3YzIZSDnRSv/ewulyJd9KDh+r675JgSsNl5OZBpCXt5w0a87sU6yueUxo1mbGOMxGOBVtCwDp+pFVM=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr16189276ots.250.1578991330906;
 Tue, 14 Jan 2020 00:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20200110153207.70c888cd@canb.auug.org.au>
In-Reply-To: <20200110153207.70c888cd@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jan 2020 09:41:57 +0100
Message-ID: <CAMuHMdVY2W1=9paE+WpJUHprocOdutRMcNUJenn+jz9A-iv90A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/mixed; boundary="000000000000622738059c159180"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--000000000000622738059c159180
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Fri, Jan 10, 2020 at 5:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the usb-gadget tree got a conflict in:
>
>   drivers/usb/cdns3/gadget.c
>
> between commit:
>
>   f616c3bda47e ("usb: cdns3: Fix dequeue implementation.")
>
> from Linus' tree and commit:
>
>   4f1fa63a6dc2 ("usb: cdns3: Add streams support to cadence USB3 DRD driver")
>
> from the usb-gadget tree.
>
> I have no idea how to handle this, so I just dropped the usb-gadget tree
> for today - it clearly needs to be rebased on Linus' tree anyway (it
> has a few shared patches that are different commits and there are
> further changes to this file in Linus' tree as well.  rebasing onto
> (or merging with) v5.5-rc6 may be useful.

For today's renesas-drivers, I'm using the attached conflict resolution.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--000000000000622738059c159180
Content-Type: text/x-patch; charset="US-ASCII"; name="drivers_usb_cdns3_gadget.c.diff"
Content-Disposition: attachment; filename="drivers_usb_cdns3_gadget.c.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k5dmnf820>
X-Attachment-Id: f_k5dmnf820

ZGlmZiAtLWNjIGRyaXZlcnMvdXNiL2NkbnMzL2dhZGdldC5jCmluZGV4IGU0ODIwYmQ0YjU3OTEz
ODEsNGRhZGM4NWFkOTkyZjA4YS4uMDAwMDAwMDAwMDAwMDAwMAotLS0gYS9kcml2ZXJzL3VzYi9j
ZG5zMy9nYWRnZXQuYworKysgYi9kcml2ZXJzL3VzYi9jZG5zMy9nYWRnZXQuYwpAQEAgLTExNDUs
MzcgLTE0MzYsNTYgKzE0MzYsNjQgQEBAIHN0YXRpYyB2b2lkIGNkbnMzX3RyYW5zZmVyX2NvbXBs
ZXRlZChzdAogIAkJcmVxdWVzdCA9IGNkbnMzX25leHRfcmVxdWVzdCgmcHJpdl9lcC0+cGVuZGlu
Z19yZXFfbGlzdCk7CiAgCQlwcml2X3JlcSA9IHRvX2NkbnMzX3JlcXVlc3QocmVxdWVzdCk7CiAg
CiArCQl0cmIgPSBwcml2X2VwLT50cmJfcG9vbCArIHByaXZfZXAtPmRlcXVldWU7CiArCiArCQkv
KiBSZXF1ZXN0IHdhcyBkZXF1ZXVlZCBhbmQgVFJCIHdhcyBjaGFuZ2VkIHRvIFRSQl9MSU5LLiAq
LwogKwkJaWYgKFRSQl9GSUVMRF9UT19UWVBFKHRyYi0+Y29udHJvbCkgPT0gVFJCX0xJTkspIHsK
ICsJCQl0cmFjZV9jZG5zM19jb21wbGV0ZV90cmIocHJpdl9lcCwgdHJiKTsKICsJCQljZG5zM19t
b3ZlX2RlcV90b19uZXh0X3RyYihwcml2X3JlcSk7CiArCQl9CiArCi0gCQkvKiBSZS1zZWxlY3Qg
ZW5kcG9pbnQuIEl0IGNvdWxkIGJlIGNoYW5nZWQgYnkgb3RoZXIgQ1BVIGR1cmluZwotIAkJICog
aGFuZGxpbmcgdXNiX2dhZGdldF9naXZlYmFja19yZXF1ZXN0LgotIAkJICovCi0gCQljZG5zM19z
ZWxlY3RfZXAocHJpdl9kZXYsIHByaXZfZXAtPmVuZHBvaW50LmFkZHJlc3MpOworIAkJaWYgKCFy
ZXF1ZXN0LT5zdHJlYW1faWQpIHsKKyAJCQkvKiBSZS1zZWxlY3QgZW5kcG9pbnQuIEl0IGNvdWxk
IGJlIGNoYW5nZWQgYnkgb3RoZXIgQ1BVCisgCQkJICogZHVyaW5nIGhhbmRsaW5nIHVzYl9nYWRn
ZXRfZ2l2ZWJhY2tfcmVxdWVzdC4KKyAJCQkgKi8KKyAJCQljZG5zM19zZWxlY3RfZXAocHJpdl9k
ZXYsIHByaXZfZXAtPmVuZHBvaW50LmFkZHJlc3MpOwogIAotIAkJaWYgKCFjZG5zM19yZXF1ZXN0
X2hhbmRsZWQocHJpdl9lcCwgcHJpdl9yZXEpKQotIAkJCWdvdG8gcHJlcGFyZV9uZXh0X3RkOwor
IAkJCWlmICghY2RuczNfcmVxdWVzdF9oYW5kbGVkKHByaXZfZXAsIHByaXZfcmVxKSkKKyAJCQkJ
Z290byBwcmVwYXJlX25leHRfdGQ7CiAgCi0gCQl0cmIgPSBwcml2X2VwLT50cmJfcG9vbCArIHBy
aXZfZXAtPmRlcXVldWU7Ci0gCQl0cmFjZV9jZG5zM19jb21wbGV0ZV90cmIocHJpdl9lcCwgdHJi
KTsKKyAJCQl0cmIgPSBwcml2X2VwLT50cmJfcG9vbCArIHByaXZfZXAtPmRlcXVldWU7CisgCQkJ
dHJhY2VfY2RuczNfY29tcGxldGVfdHJiKHByaXZfZXAsIHRyYik7CisgCisgCQkJaWYgKHRyYiAh
PSBwcml2X3JlcS0+dHJiKQorIAkJCQlkZXZfd2Fybihwcml2X2Rldi0+ZGV2LAorIAkJCQkJICJy
ZXF1ZXN0X3RyYj0weCVwLCBxdWV1ZV90cmI9MHglcFxuIiwKKyAJCQkJCSBwcml2X3JlcS0+dHJi
LCB0cmIpOwogIAotIAkJaWYgKHRyYiAhPSBwcml2X3JlcS0+dHJiKQotIAkJCWRldl93YXJuKHBy
aXZfZGV2LT5kZXYsCi0gCQkJCSAicmVxdWVzdF90cmI9MHglcCwgcXVldWVfdHJiPTB4JXBcbiIs
Ci0gCQkJCSBwcml2X3JlcS0+dHJiLCB0cmIpOworIAkJCXJlcXVlc3QtPmFjdHVhbCA9IFRSQl9M
RU4obGUzMl90b19jcHUodHJiLT5sZW5ndGgpKTsKKyAJCQljZG5zM19tb3ZlX2RlcV90b19uZXh0
X3RyYihwcml2X3JlcSk7CisgCQkJY2RuczNfZ2FkZ2V0X2dpdmViYWNrKHByaXZfZXAsIHByaXZf
cmVxLCAwKTsKICAKLSAJCXJlcXVlc3QtPmFjdHVhbCA9IFRSQl9MRU4obGUzMl90b19jcHUodHJi
LT5sZW5ndGgpKTsKLSAJCWNkbnMzX21vdmVfZGVxX3RvX25leHRfdHJiKHByaXZfcmVxKTsKLSAJ
CWNkbnMzX2dhZGdldF9naXZlYmFjayhwcml2X2VwLCBwcml2X3JlcSwgMCk7CisgCQkJaWYgKHBy
aXZfZXAtPnR5cGUgIT0gVVNCX0VORFBPSU5UX1hGRVJfSVNPQyAmJgorIAkJCSAgICBUUkJTX1BF
Ul9TRUdNRU5UID09IDIpCisgCQkJCWJyZWFrOworIAkJfSBlbHNlIHsKKyAJCQkvKiBSZS1zZWxl
Y3QgZW5kcG9pbnQuIEl0IGNvdWxkIGJlIGNoYW5nZWQgYnkgb3RoZXIgQ1BVCisgCQkJICogZHVy
aW5nIGhhbmRsaW5nIHVzYl9nYWRnZXRfZ2l2ZWJhY2tfcmVxdWVzdC4KKyAJCQkgKi8KKyAJCQlj
ZG5zM19zZWxlY3RfZXAocHJpdl9kZXYsIHByaXZfZXAtPmVuZHBvaW50LmFkZHJlc3MpOworIAor
IAkJCXRyYiA9IHByaXZfZXAtPnRyYl9wb29sOworIAkJCXRyYWNlX2NkbnMzX2NvbXBsZXRlX3Ry
Yihwcml2X2VwLCB0cmIpOwogIAotIAkJaWYgKHByaXZfZXAtPnR5cGUgIT0gVVNCX0VORFBPSU5U
X1hGRVJfSVNPQyAmJgotIAkJICAgIFRSQlNfUEVSX1NFR01FTlQgPT0gMikKKyAJCQlpZiAodHJi
ICE9IHByaXZfcmVxLT50cmIpCisgCQkJCWRldl93YXJuKHByaXZfZGV2LT5kZXYsCisgCQkJCQkg
InJlcXVlc3RfdHJiPTB4JXAsIHF1ZXVlX3RyYj0weCVwXG4iLAorIAkJCQkJIHByaXZfcmVxLT50
cmIsIHRyYik7CisgCisgCQkJcmVxdWVzdC0+YWN0dWFsICs9IFRSQl9MRU4obGUzMl90b19jcHUo
dHJiLT5sZW5ndGgpKTsKKyAKKyAJCQlpZiAoIXJlcXVlc3QtPm51bV9zZ3MgfHwKKyAJCQkgICAg
KHJlcXVlc3QtPm51bV9zZ3MgPT0gKHByaXZfZXAtPnN0cmVhbV9zZ19pZHggKyAxKSkpIHsKKyAJ
CQkJcHJpdl9lcC0+c3RyZWFtX3NnX2lkeCA9IDA7CisgCQkJCWNkbnMzX2dhZGdldF9naXZlYmFj
ayhwcml2X2VwLCBwcml2X3JlcSwgMCk7CisgCQkJfSBlbHNlIHsKKyAJCQkJcHJpdl9lcC0+c3Ry
ZWFtX3NnX2lkeCsrOworIAkJCQljZG5zM19lcF9ydW5fc3RyZWFtX3RyYW5zZmVyKHByaXZfZXAs
IHJlcXVlc3QpOworIAkJCX0KICAJCQlicmVhazsKKyAJCX0KICAJfQogIAlwcml2X2VwLT5mbGFn
cyAmPSB+RVBfUEVORElOR19SRVFVRVNUOwogIAo=
--000000000000622738059c159180--
