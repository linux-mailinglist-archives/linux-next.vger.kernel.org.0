Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CFB232A2B
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 04:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgG3CzI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 22:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgG3CzH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 22:55:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49786C061794;
        Wed, 29 Jul 2020 19:55:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHFPx5z7vz9sR4;
        Thu, 30 Jul 2020 12:55:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596077703;
        bh=KeMsUgTTRQJUB2ALeA/VNpxNjkkQHAcqAD41AHy8QFA=;
        h=Date:From:To:Cc:Subject:From;
        b=k2isr9KVTnTwNMTNwyKuK67O+quMJv4e32jfXdyEDlVy7ylhA4yHagA2H5kNYgIH2
         ga9/j0CJTGLlhxJJPrcyWDI+uVPmGTilnvENj7F4idMQ2/hftGlVxkIFIU+Out5U8V
         0895d2w2Jj6C1WC/UzH61duJcn7v8GQOYEiv6pXb17+uJ4LW9e9r8+3ADL9P/MLkNk
         NaEvUaUy5fN8tmqUMUbSu+2VWYrTFy+XZCialTIVta+Oho2w+SxAPWhwpCJBS4jB7t
         F1KpzrohVkTNrBq4qKw/APramRsi/bEd6GMST30qDw25ZmQ9rjoILsgQcCzbi/MhsH
         a9cyExu4OnVYg==
Date:   Thu, 30 Jul 2020 12:55:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Neal Liu <neal.liu@mediatek.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20200730125500.0947e1dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A+5Dkh0co2cLrus.5Zan56l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A+5Dkh0co2cLrus.5Zan56l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/acpi/processor_idle.c: In function 'acpi_idle_enter_s2idle':
drivers/acpi/processor_idle.c:666:4: warning: 'return' with no value, in fu=
nction returning non-void [-Wreturn-type]
  666 |    return;
      |    ^~~~~~
drivers/acpi/processor_idle.c:657:12: note: declared here
  657 | static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
      |            ^~~~~~~~~~~~~~~~~~~~~~
drivers/acpi/processor_idle.c:670:4: warning: 'return' with no value, in fu=
nction returning non-void [-Wreturn-type]
  670 |    return;
      |    ^~~~~~
drivers/acpi/processor_idle.c:657:12: note: declared here
  657 | static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
      |            ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  efe9711214e6 ("cpuidle: change enter_s2idle() prototype")

--=20
Cheers,
Stephen Rothwell

--Sig_/A+5Dkh0co2cLrus.5Zan56l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iNoQACgkQAVBC80lX
0Gw2vgf8D04zaNBUbkQJ3cFJ7Sx+BwSWJLsrs9iyIMlgVHw+rcMZEAxJEkD2WVCh
0tp/JmsK385QFdXVObKNgGAlz8V5pFx+pLUO7tEY6pCok7JKaY7FyJz0Wa+mvDnV
yOcv0YB/mct8EWsnupB9cKm0gcHKyUOcCEdNV/IQvXpjhwZWMQIyQfWNR7BP6bqP
GHcZxjY2Aeghln+GIQNDFDJYAqKHtAHkFDgStPa6OfawwpWUWGnuDDqVCyTIXffY
dmnfyIX9ASpEyFotmUNmukbMhJQ2Z0dL/LRd1Itk3+SwNVpp/5v1BEMOzqiOMTb5
xjgIDLm7fWtSsCKWYEwSqa9vJGjm3w==
=HtkD
-----END PGP SIGNATURE-----

--Sig_/A+5Dkh0co2cLrus.5Zan56l--
