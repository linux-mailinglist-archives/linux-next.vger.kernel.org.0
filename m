Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE28186A0F
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 12:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbgCPLaS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 07:30:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40481 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730698AbgCPLaR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 07:30:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id z12so8416628wmf.5;
        Mon, 16 Mar 2020 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u10mLbx13rBjuUZ6X11Wbn8nkL4El9jkpcLiVIu0+S8=;
        b=uAWvXPKWxndSsk4VsF2Qr1gnE5v+0qvFoIhcuUZpA/QweCy6iKBAUcs23tt/ZrHfDp
         G/DOAwWYKuxon9Mn6oXv9GTodjnZQYFnXfUDAaA1HpYaaWAkwvZ2eAjHfsaxBEsop97D
         4YaEUaP2CfSwIVNeKy8mQX9JkvwIZ5+o3ahU59Bgeo6pCQVwf9fGSNhutnz0PadNqR24
         t18QQyFe5QYw8VQ7L2CVIjWUYo/FC6jTHGEqMfiB7vXeILd3pFN60eqQhMfgLdBE2Zxj
         NQumidioxcGtxAQxJxb3gQICMBPyl3N92vhIZ8qRNaag/ZjHgeiu2/1jD7abVY/g64DX
         pGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u10mLbx13rBjuUZ6X11Wbn8nkL4El9jkpcLiVIu0+S8=;
        b=Y8biRAHYOa4YmUJUBjge4J0r82+ReD2qi7yldWOBmWEWy+wPYD4WuhoM7f7Brc4HKR
         hC5U4MjoxLKXoQmD8pe4oK5PT+GOfRwBmgHUeOS0LuD6NyAppfBsxHq3AKD8eGy7dJle
         CyTtsk/W59oy429E8rvtWjmR/OV+8rig6UWJZrxcNOfzKwHf4dNW4xBFSKiusjMGrRF3
         yCXR60JP1jqVLJYXqdH6axQukv7ZDqZmvhay/tPNqF0lM6kFoAdU2fWM3bxwAXJsmkZT
         VVXZdmHTUKb9m6Ay6bIjOMCYtqAF0ZlYvvIcKK6G2yGiU1z6VXuL1KBrkISI5+uvPx0V
         Wyjg==
X-Gm-Message-State: ANhLgQ1IcDdjUM2sR41p/PzdMtTWYv1tzRSHB1/ghbNh0aI824QQE+Dv
        v+3yBrbR6fxCB84TXM04vwQ=
X-Google-Smtp-Source: ADFU+vu5azq6cmrHqo5F5U539HET90FApjVVwnLS67MGRj95kRNbWIhE50zh7SRipACC6dEHbReCzQ==
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr25503240wmk.46.1584358215746;
        Mon, 16 Mar 2020 04:30:15 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id g127sm31035875wmf.10.2020.03.16.04.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 04:30:14 -0700 (PDT)
Date:   Mon, 16 Mar 2020 12:30:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <20200316113012.GA3049021@ulmo>
References: <20200316141004.171649a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20200316141004.171649a5@canb.auug.org.au>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 02:10:04PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/phy/tegra/xusb.c: In function 'tegra_xusb_setup_usb_role_switch':
> drivers/phy/tegra/xusb.c:641:10: error: initialization of 'int (*)(struct=
 usb_role_switch *, enum usb_role)' from incompatible pointer type 'int (*)=
(struct device *, enum usb_role)' [-Werror=3Dincompatible-pointer-types]
>   641 |   .set =3D tegra_xusb_role_sw_set,
>       |          ^~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/tegra/xusb.c:641:10: note: (near initialization for 'role_sx_=
desc.set')
>=20
> Caused by commit
>=20
>   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the swi=
tch in the API")
>=20
> interacting with commit
>=20
>   5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")
>=20
> from the tegra tree.
>=20
> I have added this merge fix patch (which may need more work):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Mar 2020 14:04:20 +1100
> Subject: [PATCH] phy: tegra: fix up for set_role API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/phy/tegra/xusb.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index d907f03bf282..25223c350e66 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -596,11 +596,12 @@ static void tegra_xusb_usb_phy_work(struct work_str=
uct *work)
>  	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_phy);
>  }
> =20
> -static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
> +static int tegra_xusb_role_sw_set(struct usb_role_switch *sw,
> +				  enum usb_role role)
>  {
> -	struct tegra_xusb_port *port =3D dev_get_drvdata(dev);
> +	struct tegra_xusb_port *port =3D usb_role_switch_get_drvdata(sw);
> =20
> -	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
> +	dev_dbg(&port->dev, "%s(): role %s\n", __func__, usb_roles[role]);
> =20
>  	schedule_work(&port->usb_phy_work);
> =20
> --=20
> 2.25.0

I can rebase the branch that contains this commit on top of Greg's USB
tree. These are a dependency for the UDC and host driver changes that I
have sent as a pull request to Greg, so this should all work out nicely.

Greg, I recall that you've said in the past that you don't rebase your
trees. Is that still the case for the USB tree? Do you have a preference
what to base my branch on? The earliest of your USB tree that contains
all patches needed to make this compile? Or the latest?

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5vYzwACgkQ3SOs138+
s6HYsA//R8FjHDxAalqcSRUQWMth+qdvNLypSWmB9ZJbhglP+b4RvokeaP4ZzFeo
AVavdyHUWROF2Uh/YGfPWaFlAiPwmJz3we0Fk1uk0F3aEO5B0wBBbVQ7DnKW7Rqa
BI0eRkP0YyuwvsBRLcUYfaLW+StRn5PQzc+YggjGqQwJs9BRAqEc/6VitlMj4A9B
q0C1w3pOJ7/5P7WZ0brDcoay1mkHZQ8cExlW+iWFufkazzG3T3Z9IVFqDxSvElTu
kLmJax6ubC/jMX1YlRQ6GN4V3YIxGx+fWPYrGSM+a/dRIIUhLFEI5yKC8WLNr9SY
9Dnw4AL4U+XnEvS+kvQTpWu0j9FT9T7q5Zrijn/U3Lj4Hl0p5YEMVstL9iCGkZ0h
w4tIVCsWw+Kihhvlc3mA9TKe/xt+CZhpJZ6CtEl15Soz4YLRPVA0NrlPdEYsIzvo
P24n6uGEsvavmeXVRGw4sOW4LByXl4Aijd9omU405z+3RIbM4m5i0FvOVROdGoD+
9+ipP2Sptgti8FOoWqtnN1nFf49DeXSiLNb5kbWmIOmmyCsZI7WWdBNYx8tLBKhB
kjZsc7sicNXbT1qeY300Wxm7YW1YVwiwZHWJFC0pcfHg9Z5tc9obVuj3gZGWqjPK
V8aoOspwmxKH7lh6N4maZVhxN4/CsjVpEhrcF6velt2RaFw8gz8=
=TXzi
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
