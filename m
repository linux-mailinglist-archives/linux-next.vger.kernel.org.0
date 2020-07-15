Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF292214F1
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 21:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgGOTP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 15:15:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbgGOTPP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jul 2020 15:15:15 -0400
Received: from [192.168.1.30] (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2B912076C;
        Wed, 15 Jul 2020 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594840493;
        bh=bS6Zlw5a8pnZ+kGAgptHo8NYI67fecSpN3EPQ25iOdk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hPK6ggqTLfHVGCixV/YOD1nEDtNvW1uCBZWZatJ5MEpl3N7JKXsd44ZZq6wF/llBA
         bDc/yf9VZt7g9LtmMOwiPIfppHmrQFiHaj22boygV9OxMxYntW5MVISIssdhojZsYZ
         tVoDEZyRFG9/KGcU/XLDpfvpOhTb0Hwo3iKJPWBc=
Subject: Re: linux-next: Fixes tags need some work in the arm-soc-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20200714075729.68b92239@canb.auug.org.au>
From:   Dinh Nguyen <dinguyen@kernel.org>
Autocrypt: addr=dinguyen@kernel.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1381a6c0-22fe-a175-f649-ea49da3451da@kernel.org>
Date:   Wed, 15 Jul 2020 14:14:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714075729.68b92239@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

I apologize for this! I have an updated branch that fixes these tags.
Let me know if I need to respin the pull request.

Thanks,
Dinh

On 7/13/20 4:57 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
> 3e189a193471 ("ARM: dts: socfpga: Align L2 cache-controller
> nodename with dtschema")
>
> Fixes tag
>
> Fixes: 475dc86d08de ("arm: dts: socfpga: Add a base DTSI for
> Altera's Arria10
>
> has these problem(s):
>
> - Subject has leading but no trailing parentheses - Subject has
> leading but no trailing quotes
>
> In commit
>
> 8e343e71b092 ("arm64: dts: stratix10: increase QSPI reg address in
> nand dts file")
>
> Fixes tag
>
> Fixes: 80f132d73709 ("arm64: dts: increase the QSPI reg address for
> Stratix10
>
> has these problem(s):
>
> - Subject has leading but no trailing parentheses - Subject has
> leading but no trailing quotes
>
> In commit
>
> c188c8348836 ("arm64: dts: stratix10: add status to qspi dts
> node")
>
> Fixes tag
>
> Fixes: 0cb140d07fc75 ("arm64: dts: stratix10: Add QSPI support for
>
> has these problem(s):
>
> - Subject has leading but no trailing parentheses - Subject has
> leading but no trailing quotes
>
> In commit
>
> 390a90089db5 ("arm64: dts: agilex: add status to qspi dts node")
>
> Fixes tag
>
> Fixes: c4c8757b2d895 ("arm64: dts: agilex: add QSPI support for
> Intel
>
> has these problem(s):
>
> - Subject has leading but no trailing parentheses - Subject has
> leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEoHhMeiyk5VmwVMwNGZQEC4GjKPQFAl8PVaQACgkQGZQEC4Gj
KPSLEw//VBkdiYVC0tiIgVumxbIg8ySSPWtsMv9uQ9lL/gx/96OAu6QgHfnUTEYK
aBiFnN0xvIY8BNITF3bDT1FNRbQaZKrr/tXxY3HW9Re0j7izk+p5e524b6u5RO0f
Buoz/zAFif7SW3ZYlX1y/L4QpUIzsK+uOtE6RSUY2mwBoZ5li14LQruTjfU+nWLo
noWxVxIyRmT9AjNvaN282Rvyhbc3YKZ1vemy+DcKzh/wRLXsP/tMP/eXFmrvbwFP
O4cq/HPthwenhEpqWqDWq43SiZKwqVwQmNzJ3+yfTTdbF/hgmPazKSH1vRvrixfB
V0/g8uFigigE2Oniwu238NFHOJ9ZnWQKBiZEKlGG/SZZJE7u/fYYYVjX0/4t//n6
JX9dQEIaHPX95nkAdMWIQdlkW96yzPmf0X864oaahc1GrMJUEPXNjuuVs7nTEXuy
Srfl4TpXUp8FHVjyz/SjG9etw0h1moJuRyTS/SlJMoGGM4fuIKTrJWh3EUwjIq9w
U1gAT//6/D5RvfRKo+6l+OHJrX47wSAbPMFtEUcKXnejib6YJkGk7Xyvc2gPNC9b
J7xYbUV+i2Aedm28ijwPrAZ9mud8+/A9q2mCWmreGiRQShiNHRCoDE9G2z1dIl48
RVVj7R2nbVqw3/oZ+13vwfu9Nl6KMjHkU1W/wHIKpghwZXIdLkA=
=yd8H
-----END PGP SIGNATURE-----
