Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C471E7894
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 10:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgE2IoU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 04:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgE2IoT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 04:44:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6A5C03E969;
        Fri, 29 May 2020 01:44:19 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c11so1626500ljn.2;
        Fri, 29 May 2020 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=aA1DbZqMrb3nuAm8eHUzidlpJW1ByXtDv2mm8YjKryo=;
        b=SAWv3wnXqsv7Y3pxgZWlvzZalgFPFTzVTKEK6ypzZzqE/6V0NX0MPfwM03cFu/W2kE
         N3YLgGyMAbhxySjsnmLmjd2i6wxFQ7C0U42EXwA/G/porjhiKc4qKkymrYwPSN6ZqNP4
         tc1X8MmUdNLlM7yzdPPfpjoaY7uFdkKKf6TpEx1voFgestpEhTk3DTL+1zx0sLyIOFA/
         ukdBNIaaSYFMqXKSV9mef3HDQlTAfGGotmkUap/u7pbXutbER0lmPXU5eKsJiYjzUVde
         9zzZfUkKjYc3m7Gg+BrWfxnXTW/7j7jZra7yvrreeWBFNU28GkRX3whSKDJ7VGOogH2i
         5sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=aA1DbZqMrb3nuAm8eHUzidlpJW1ByXtDv2mm8YjKryo=;
        b=kflF7K5qfglIodmPImi9zwdo8mdIHAsNSMoiKt65o0T6WR9cKtzSLHGyFredXrV/t2
         IUfChtHHxnLOdvl11sLoK+LTAsaNsBQn4l/sF07VpK5Fttw8Hl71z5OsvcZbIbLXzqUi
         CwZHR7E+mcWTCLa52fySfCOeVJ7MWdQ0kwG7n1+w/0vWqJPWs7mS5P5FwZB6Q+LEkLav
         GwshS16ZW6zArQTUVQJ8WsQR4g2bv/r2lZ3DqrhtWvX6so+cQlECpwjN2Ig+NkPhJnhS
         3c0kGOut/yyOHga+HA5p6O8c1AFryQ0CGxiDqxlv2winolrgdkTy4ScI7zE//C29N0ds
         2mZA==
X-Gm-Message-State: AOAM533VpHLQbZuNApIx1UbcIKTPnkGXeYA8V3ZN4UT0TmQkR82nMHlZ
        zkteiq3vEhwjBU5PPk7qKGPh1A0v
X-Google-Smtp-Source: ABdhPJzGCU72MSBj9IQVIVRc+PXVKZjyZJ4IbA0VDU5Ujkh1u46648TqcnuTc6rbJIhPBY732CSxyw==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr3818749ljj.284.1590741857801;
        Fri, 29 May 2020 01:44:17 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id e19sm1875166lja.19.2020.05.29.01.44.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 01:44:16 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
In-Reply-To: <20200529082840.GC847132@kroah.com>
References: <20200528162215.3a9aa663@canb.auug.org.au> <20200528104916.GD3115014@kroah.com> <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com> <20200529082641.GB847132@kroah.com> <20200529082840.GC847132@kroah.com>
Date:   Fri, 29 May 2020 11:44:12 +0300
Message-ID: <87pnan1677.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Greg KH <greg@kroah.com> writes:
> On Fri, May 29, 2020 at 10:26:41AM +0200, Greg KH wrote:
>> On Thu, May 28, 2020 at 08:14:36AM -0600, Rob Herring wrote:
>> > On Thu, May 28, 2020 at 4:49 AM Greg KH <greg@kroah.com> wrote:
>> > >
>> > > On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
>> > > > Hi all,
>> > > >
>> > > > Today's linux-next merge of the usb tree got a conflict in:
>> > > >
>> > > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> > > >
>> > > > between commit:
>> > > >
>> > > >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bin=
dings")
>> > > >
>> > > > from the devicetree tree and commits:
>> > > >
>> > > >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bin=
dings")
>> > > >
>> > > > from the usb tree.
>> > > >
>> > > > I fixed it up (I guessed, taking most changes from the former) and=
 can
>> > > > carry the fix as necessary. This is now fixed as far as linux-next=
 is
>> > > > concerned, but any non trivial conflicts should be mentioned to yo=
ur
>> > > > upstream maintainer when your tree is submitted for merging.  You =
may
>> > > > also want to consider cooperating with the maintainer of the
>> > > > conflicting tree to minimise any particularly complex conflicts.
>> >=20
>> > Ugg, I fixed up a warning on my side...
>> >=20
>> > >
>> > > Sounds good,t hanks.
>> >=20
>> > Greg, can you revert your copy and we can get rid of the conflict.

Did things change recently? I always got the message from DT folks that
DT changes should go via the driver tree. Has that changed? I can stop
taking DT patches, no problem.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7Qy1wACgkQzL64meEa
mQaEAQ//ebGPFJPFZCDBmR/81gfFtkrWLbe5ffGQ5IqZETfC8bUijVp5Ge94fxJv
9m9BcA73PHxiIzTs18CzMiQ0FQ39We5J2VL3jpbgBBbdWJu57v5D1ioAm7HDWCp/
8l+Zoy8FvsxmrwiT6FDXtHrp+DZZdfEmN8owWlmu00MorON0e4X6GVwYiaOqRB/7
6Wozo2LhaqghD67TgT3cTMvxWWSL4ebqU+0EWnmZ3WkkHGE+gVaN8RIG6MFSDvsu
+5IvUmHdi40bqtwsFW111bZvb0shNVl5R62cmK7qGASX1+yDT9rncRxAgrR79d7H
v3av0iT4xpu0zpzW8QnbbehAZYkek1lColNwHuopJSo9HyhzVHIvv7KBRYqI8unX
yXOFMraqhVb8mEvtJ3E1OwO5e0tZOPpASd4flOWo/XQO4cHmabtpaet0YNm0XQWQ
HfsuItku6K0Jw9216YSWeehnZ2RDXA6AN34MrfhQLWGSk/+uQ7LCGC+5LkXUWimY
0/asEj3ZCnrNpB+bkyr+X9npdPRDbJgXjQ9r//0vhSDKOF5tRQdkvTs8pMG3OUaB
ewJ8AnzTpzQVzGzQzmfDanPtiiUBM5558nOWwafMHEqPWBIigMg5Pe9Q1WrtuP9p
vK8dDLgz7bcNN1K/7RagQkElMowE6M9+ZKdE6Wxpu+40HBhTZeI=
=cfKX
-----END PGP SIGNATURE-----
--=-=-=--
