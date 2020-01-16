Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259C213DB19
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 14:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgAPNG1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 08:06:27 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34278 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAPNG1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 08:06:27 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so15523392lfc.1;
        Thu, 16 Jan 2020 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=+dNIN0Bjh5Sxdgv0PYr0Z5RysmQAzFZOMNbfc2kLg64=;
        b=bpnPK79KV8o1kxZWO2tX6t8DYBai/NrXry7NuVI+5uPOVE0k9lc6d+ARUf2cN9bxf/
         5WJW5601UNN7/NimbpIgTrqweltBCD1kBQAQIqDf2wny3D53fBc+L4Yapykz2LevNFcN
         bck07JqEMIMsh7RBuGkHWvYCwxWLh4DevgmqkEAGgVRVVGX1BsuDiyalR9+XQb/6pjwn
         k6mUTr7p5fPvCwC9/p6UGhGF5flumXwyYSf5I/MmO5M3t7fDONpQao4Lr5es+46mM3Se
         IGCk3xbKs+5F8Ja1qlalybnqI+olQ03wjhR108GUtDzNxdhUVUwCdL+cfA570MFoIJt8
         IlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=+dNIN0Bjh5Sxdgv0PYr0Z5RysmQAzFZOMNbfc2kLg64=;
        b=rxCdOKKWNoCu19bu9n4seyjjkMskzVCZM88JpMyfHUknurm+mwwZDjHy5nRfGK4X1G
         FRZjwtmQCHNRetT+Anzz192yjGBK+0NYNHqjmn7GQvYTq4Pc6AZc3AtLbUQQShSQSU3v
         hv08roMik0wPAmIZfdJ4BAVATEAIRwmDh/scBa7BLjOFUoUgXozRw2Rf81h2UHKDwyqc
         qRHRMRKWFPP4xspIiCwVh/063I5opkUgjZjgve9megk54mTn9u88ZSIMjyRhcc0fVHiV
         hETvC4QJbA70cCvxUXYggtdOWYCZDCKnGUVDejUTPWU119znsB7tVV3hxKdxNGiU3CRa
         jU2Q==
X-Gm-Message-State: APjAAAVVJZ2ddLkvNNGhf8FiW+Dd2ruDYgGuSTuLpCh2IseI9ho7cEbI
        fSZEfp9R+AOorU8nhBFUwY+xJ0zN9WANzQ==
X-Google-Smtp-Source: APXvYqxGw8p8gSkVUsyQc0mke41Aje2NcawWOQbz83HoLaJGXLV3PNEs1w430cZplT5IhJcD2DDGhQ==
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr2529380lfp.133.1579179984942;
        Thu, 16 Jan 2020 05:06:24 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id k12sm10540574lfc.33.2020.01.16.05.06.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 05:06:24 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the usb-gadget tree
In-Reply-To: <20200116133930.74afaa91@canb.auug.org.au>
References: <20200116070726.7e2ef8cc@canb.auug.org.au> <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org> <20200116124100.58af81d5@canb.auug.org.au> <6b984328-b3f4-a23d-efb3-7e7955ad165a@linaro.org> <20200116125851.474f3021@canb.auug.org.au> <043cbd87-1d7d-e998-04a8-bbc9aec686df@linaro.org> <20200116133930.74afaa91@canb.auug.org.au>
Date:   Thu, 16 Jan 2020 15:07:24 +0200
Message-ID: <87d0bj5z3n.fsf@kernel.org>
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


Hi

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Bryan,
>
> On Thu, 16 Jan 2020 02:08:55 +0000 Bryan O'Donoghue <bryan.odonoghue@lina=
ro.org> wrote:
>>
>> On 16/01/2020 01:58, Stephen Rothwell wrote:
>> >=20
>> > On Thu, 16 Jan 2020 01:45:25 +0000 Bryan O'Donoghue <bryan.odonoghue@l=
inaro.org> wrote:=20=20
>> >>
>> >> On 16/01/2020 01:41, Stephen Rothwell wrote:=20=20
>> >>> Hi Bryan,
>> >>>
>> >>> On Thu, 16 Jan 2020 01:19:22 +0000 Bryan O'Donoghue <bryan.odonoghue=
@linaro.org> wrote:=20=20
>> >>>>
>> >>>> How should extra long fixes like this be divided up ?=20=20
>> >>>
>> >>> Just let them run on even if they are too long i.e. don't split them=
 at all.=20=20
>> >>
>> >> That's what's in the git commit log though isn't it ?=20=20
>> >=20
>> > When you add a Fixes: tag to a commit, you quote the subject line of
>> > the commit you are fixing which, by definition, is a single line.  We
>> > want to keep it that way so it can be searched for easily.
>> >=20
>> > So to create a fixes line you can use this:
>> >=20
>> > git log -1 --format=3D'Fixes: %h ("%s")' <commit being fixed>
>> >=20
>> > i.e. in this case:
>> >=20
>> > $ git log -1 --format=3D'Fixes: %h (\"%s\")' 40d133d7f5426
>> > Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function inte=
rface with backward compatibility")
>> >=20=20=20
>>=20
>> doh sorry still not seeing it
>>=20
>> git remote -v
>> usb-next	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=20
>> (fetch)
>>=20
>> git fetch usb-next
>> git show 5b24c28cfe13
>>=20
>> that's a correctly formatted fixes right i.e. the same one as above
>>=20
>> :(
>>=20
>> not seeing the difference...
>
> Now I see our confusion.  There is another version of this patch in
> Felipe's tree as a different commit (6a6ae4e8e926) which has the Fixes
> tag split ...

Right, Greg applied my tree as patches to fix this problem. I need to
rebase my tree on Greg's to get rid of this problem.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4gYAwACgkQzL64meEa
mQa55w//YQdHsr9ZTJ5WnNG3W05EC7qG6HDXzicUiSf2XyrnRytXO6IMxGFTQ9I7
iEUbF1iudLZ6jdSbSbYEnkBTRL9iMrFYQSMy6IWgedTKOyn21e0gK9pELtyB62Di
tSktp8NDMiMb6WSynL1nkNmkT+NNEYAFPBGk4DLqQ8FH6io3WRQgbMR42+tYh+OQ
ZvGy88PtALdQsy/BWjiVSG86wCcpMBpO0oK+KcQV8BijPGxTaW46kFjtH2zHImXt
arXl/fODh2VHwQZPvCkFer5UBR4CM7a230yfSRqlh1HVjQHRD5XcQXp/i94ZUsIJ
ibW47ApsAv2IlqhSIzyt+78CgGTqkW7cuDGwVRQW6uQiZtVgtulZyBnRVYeIRQPt
RjIqSdaDxbn6bMmUt/sERuPwoj2PPAEHBhT4TD3X4GmFgqHlhoK8Qzm/pxsuZxz5
yHEw/lL8WLFhspdnC966VjyUnYwoj6Vuim6zzeclswFk1RL7Ny2oGgrhw30xj3bU
7/NK/1GJ/OFzJF9OHnwR3PavWm3hW8N9c2ohStW/s5FjMX5OMBe48EcuyTRhX5kE
tovBcA1uuoFkwmd7oVUlG+6alXsGo4SxHNgdZosezbF6T6gbH0Wm8jgpZpUung8U
/QGLf/LnPkCgl0h3aZdnqcj3OCssiQ1TKs4behXrx+mz/eGMdtw=
=OZMi
-----END PGP SIGNATURE-----
--=-=-=--
