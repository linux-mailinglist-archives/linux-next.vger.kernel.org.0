Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF3D18221C
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 20:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731034AbgCKTUQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 15:20:16 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35642 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730807AbgCKTUP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 15:20:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id v8so1778909lfe.2;
        Wed, 11 Mar 2020 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIT0hRGBkVYntfrYROvzPZ3SfddFZ8uhqeGjnA9rcCc=;
        b=ZD45WIybvMukm6PzyF+6qTs6iJXur3e5iu1pc8oPQLmdzPWopAl7ujPePfPAqLCIp6
         F8r6n2l7AaKvSPfr75wHIUi2V0rUDaq4vQEGJbrFTaUmW4FEWcfPCtdQD0I+EWNsQvzD
         Uf8olBoZbK7/GkLGh+r4JBuKis4vqDkTiIkYXMLm2YpmbyLUqSFBzc3dR0GZnmhTROTI
         lkLWyMLNn8RImIzjhS4uiSMztAGu1W2EkmGfj0jqT0WCp96kV9eoPINCPqJM5md39Tqg
         A9xTq3zPcY00fsazrRbRJ8VLcmghoTEayM9X9LEFUZCPhvUH5AGnNBuPD4KRnLaeXyry
         oR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIT0hRGBkVYntfrYROvzPZ3SfddFZ8uhqeGjnA9rcCc=;
        b=aZKUxin1QXPjhlpTqZWVFFDbTjG7Nh6CFKLY4Z+o929sUE7eWG0+OYYMKsMAlTYJBr
         /6KbO/BgKA2vNRkJeBQW/Vu/5v0121EiJCL7+6TRtrUskZ96ZbuAHQbbchtNU3YjGuGz
         EQBi2eWhVDTtJuAUXLF4RMjENiBf8/nt53gO04GdeW7yFIACLU89V5EwK10IakfeJnAq
         91T5qenFEkXodJcFuvke1oI9wb3KR8TxFQeno5BS3kfkDgHMnNXyqf1cPaxRf0Ik4wdc
         FRSsJtlmd+tj44+ogOoqLDCgt59adysZs7dEnZUGxJ+5ey7peWaro48jw3bjJ0mdgYLX
         41Gg==
X-Gm-Message-State: ANhLgQ1k/CJZYm37/4jaEs+C0zWtM9cK2uxVPmqeZk5VrxYkM2/fp/UR
        oMP7hU1it25dc/qYmz1Y+EkqpO0kkVM=
X-Google-Smtp-Source: ADFU+vvT9LxkUnHGGi05BhkyVwjNFxcm4DkqshVmzyLeSsqI3fOkltz/jsjzWglA1VgcuuaIOafQdQ==
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr2904608lfz.194.1583954412015;
        Wed, 11 Mar 2020 12:20:12 -0700 (PDT)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id k23sm3261755ljk.40.2020.03.11.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:20:10 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Date:   Wed, 11 Mar 2020 20:20:08 +0100
Message-ID: <5581444.lOV4Wx5bFT@z50>
In-Reply-To: <20200311111041.2dd477f5@xps13>
References: <20200311131616.41e728a1@canb.auug.org.au> <20200311111041.2dd477f5@xps13>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Miquel,

On Wednesday, March 11, 2020 11:10:41 A.M. CET Miquel Raynal wrote:
> Hi Stephen,
>=20
> + Janusz, ams-delta patch author
>=20
> Stephen Rothwell <sfr@canb.auug.org.au> wrote on Wed, 11 Mar 2020
> 13:16:16 +1100:
>=20
> > Hi all,
> >=20
> > After merging the nand tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
>=20
> Thanks for the report.
>=20
> >=20
> > FATAL: modpost: drivers/mtd/nand/raw/ams-delta: sizeof(struct of_device=
_id)=3D200 is not a modulo of the size of section __mod_of__<identifier>_de=
vice_table=3D64.
> > Fix definition of struct of_device_id in mod_devicetable.h
> >=20
> > Maybe caused by commit
> >=20
> >   966d708517e3 ("mtd: rawnand: ams-delta: Add module device tables")
> >=20
> > But I have no idea why.
> >=20
>=20
> This is strange. I think this is caused because of the addition of a
> second device table with the same "of" scope. Changing one of them to
> "platform" (the legacy one) seems to fix the problem.
>=20
> Janusz, Is the following change okay for you? I would like to apply it
> today so that linux-next get's updated with the 50+ stack of new
> patches by tomorrow.
>=20
> 	--- a/drivers/mtd/nand/raw/ams-delta.c
> 	+++ b/drivers/mtd/nand/raw/ams-delta.c
> 	@@ -411,7 +411,7 @@ static const struct platform_device_id gpio_nand_pla=
t_id_table[] =3D {
> 	                /* sentinel */
> 	        },
> 	 };
> 	-MODULE_DEVICE_TABLE(of, gpio_nand_plat_id_table);
> 	+MODULE_DEVICE_TABLE(platform, gpio_nand_plat_id_table);

Evidently a copy-paste error on my side, sorry for that.

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

> =20
> 	 static struct platform_driver gpio_nand_driver =3D {
> 	        .probe          =3D gpio_nand_probe,
>=20
>=20
> Thanks,
> Miqu=E8l
>=20




