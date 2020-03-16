Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC6F186C64
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 14:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbgCPNod (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 09:44:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37442 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731130AbgCPNod (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 09:44:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id 6so21289183wre.4;
        Mon, 16 Mar 2020 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nO7gNqCTwmPJ3cLdw6MlLopviM60j+Jf/LUmBue4U14=;
        b=bYTMLp3zWJUvBGVepm6sOE4tTLdAPmVVFdqa9vcgVDmHpbf21DK6yOxCuObtdd9d9k
         JgQb1NC5pD6ytynJoiaTVDP4KUu13PgMOBp6dCzQP868apmeXauY/nxJ89KVPnpnypPa
         d2uf2Z6hWXmwSF/a184+jlq5DGxvlHOq6KcGNbzi4HbHo28I0otg1h4aGDND7xptb2mB
         Lym/f7WoegJ8iqWhNelbLuMfdH13GbRJDFzUarHajmBkl9ACG/YMtoQXOIR+Nf6ZrLp4
         0HkYBN+eDkagHezjz8RwGFGKaLaJicFtsi4rfQf+YeLYEO5A55l4MDWNO3pb5Tk+7RPs
         V7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nO7gNqCTwmPJ3cLdw6MlLopviM60j+Jf/LUmBue4U14=;
        b=ihpUm41mwL7KtLqNUFRbiSoba6CTf7Q/1O6cefwRfxJN1jtXVezbUm4iTW8u//2UvX
         N4tMCJnrNxx8mFPNdxrsDXG0lkk3QHRSGrO7cw6qHq3wDHXWsc587EGZWS9yBVyYsmOL
         ZvET+2g/3uhqr+96iORRT2/9RKfway9/J763VJfsRVrzdyCTsF11rCt+9Bd4+TGEkgPY
         neLJwJhqCbp/dzxIAA3rn310GmWrrSEXE6pPQzdYDG4aH5KhLYBCwIPMAvN6JiUPFNOT
         8I8HQIKY955M1keT5iazSeYBCF4eD3vnxf5SqETWhNRH6GdnkC0FTFMF/Kg8j3vCSpuc
         QHzg==
X-Gm-Message-State: ANhLgQ195igEMxX4iC8SuLoWR1xJLjuj0WlTr8JZFBc3lqqlo383CEHi
        YUXwAByjJ3nubuq7tr4lAcY=
X-Google-Smtp-Source: ADFU+vtIuMs/TH2XKr3oDVVBV2LTvKuTzBgNH8YLVlpy/T2UcsmZIIR9YQjSykMAMLhZ5u2Wl90+bw==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr35806629wrn.283.1584366269667;
        Mon, 16 Mar 2020 06:44:29 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id o9sm3132wrw.20.2020.03.16.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 06:44:28 -0700 (PDT)
Date:   Mon, 16 Mar 2020 14:44:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <20200316134427.GA3825456@ulmo>
References: <20200316141004.171649a5@canb.auug.org.au>
 <20200316113012.GA3049021@ulmo>
 <20200316132850.GB3960435@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20200316132850.GB3960435@kroah.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 02:28:50PM +0100, Greg KH wrote:
> On Mon, Mar 16, 2020 at 12:30:12PM +0100, Thierry Reding wrote:
> > On Mon, Mar 16, 2020 at 02:10:04PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > After merging the usb tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >=20
> > > drivers/phy/tegra/xusb.c: In function 'tegra_xusb_setup_usb_role_swit=
ch':
> > > drivers/phy/tegra/xusb.c:641:10: error: initialization of 'int (*)(st=
ruct usb_role_switch *, enum usb_role)' from incompatible pointer type 'int=
 (*)(struct device *, enum usb_role)' [-Werror=3Dincompatible-pointer-types]
> > >   641 |   .set =3D tegra_xusb_role_sw_set,
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~
> > > drivers/phy/tegra/xusb.c:641:10: note: (near initialization for 'role=
_sx_desc.set')
> > >=20
> > > Caused by commit
> > >=20
> > >   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the=
 switch in the API")
> > >=20
> > > interacting with commit
> > >=20
> > >   5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")
> > >=20
> > > from the tegra tree.
> > >=20
> > > I have added this merge fix patch (which may need more work):
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 16 Mar 2020 14:04:20 +1100
> > > Subject: [PATCH] phy: tegra: fix up for set_role API change
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/phy/tegra/xusb.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > > index d907f03bf282..25223c350e66 100644
> > > --- a/drivers/phy/tegra/xusb.c
> > > +++ b/drivers/phy/tegra/xusb.c
> > > @@ -596,11 +596,12 @@ static void tegra_xusb_usb_phy_work(struct work=
_struct *work)
> > >  	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_p=
hy);
> > >  }
> > > =20
> > > -static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role =
role)
> > > +static int tegra_xusb_role_sw_set(struct usb_role_switch *sw,
> > > +				  enum usb_role role)
> > >  {
> > > -	struct tegra_xusb_port *port =3D dev_get_drvdata(dev);
> > > +	struct tegra_xusb_port *port =3D usb_role_switch_get_drvdata(sw);
> > > =20
> > > -	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
> > > +	dev_dbg(&port->dev, "%s(): role %s\n", __func__, usb_roles[role]);
> > > =20
> > >  	schedule_work(&port->usb_phy_work);
> > > =20
> > > --=20
> > > 2.25.0
> >=20
> > I can rebase the branch that contains this commit on top of Greg's USB
> > tree. These are a dependency for the UDC and host driver changes that I
> > have sent as a pull request to Greg, so this should all work out nicely.
>=20
> Ok, should I take your pull request then, or not?

Let me rebase things first and I'll send an updated pull request. Please
ignore the one I sent on Friday.

> > Greg, I recall that you've said in the past that you don't rebase your
> > trees. Is that still the case for the USB tree? Do you have a preference
> > what to base my branch on? The earliest of your USB tree that contains
> > all patches needed to make this compile? Or the latest?
>=20
> Yes, I do not rebase my tree.  Please work off of the usb-next branch,
> and you can send me a pull request based anywhere, it should work just
> fine :)

Great, will do.

Thanks,
Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5vgqEACgkQ3SOs138+
s6Eb+BAAoJE0qmD8u7uB+0AAfevz6Lf1WRusjXdCuqbPJhtmAOPUlVwlvczGVkz5
sSSC9GxD/lva2LI1b4w4KDkky79z9wFfTEGIpot+N3JKpu8GkzeSCKl4SYfhwNob
lGgHF9NN8us+Uz9MHzAmQ3pjXD3Do5L4IZrpbS9I74VEmqh24IXgnow0xqOFN46E
9KeS7jTjRKgN/yZ5QJalyYicT5RUbZpL17UBoOHqyfMPe1y7NrD3//dnWhn0lRS4
qrw4x1vjmQcwXiXFJ9MmIVo5fluT1qyMP+gMBZ22Bsgih+pnhXvv2PnJcL2TTcB+
7KPCPQz4jKAMyZYXqF0zvOKcnjvy26r6pF6sCk+O9kPl0vlFEpxqDWwfka0EoE3c
yevorPB+441Pfztxep3kiLqbGgl8X0U+4srPzefepSEbyTF3FFQbFwgO/dl0Vm81
XKya2Fz5GZ3Nux49Rgf918Bn94vuNS4mikJ/5oOu9edbeQbXNlNcZkJzY1gJV6is
BrA4aZMmdQViqW3BkqEY5DhPKHyPwcfm0cmk6qTY0LsoM/eqEDB3wM3+2l42TWCp
JQI4TCjv4vkgvDXFc+5XVZJMQ0kAgbXa39FUwIzSm84yBpcSh1bbISWYDQ0C3KZk
qU8VehpklUamu0pfEMXqy4nmI0n4SWlGlKLz1/QL/3GJeyWtKs4=
=R74w
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
