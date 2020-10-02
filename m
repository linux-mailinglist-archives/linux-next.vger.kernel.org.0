Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0594A280EB3
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBIX4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:23:56 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1994 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIXz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:23:55 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76e3670000>; Fri, 02 Oct 2020 01:23:03 -0700
Received: from [10.2.56.62] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:23:55 +0000
Subject: Re: [PATCH] selftests/vm: fix: make check_config.sh executable
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20201002064811.435769-1-jhubbard@nvidia.com>
 <20201002175931.5317ef64@canb.auug.org.au>
 <2bd44214-ff9c-0333-9525-3db29b9a3ff1@nvidia.com>
Message-ID: <c1036d8a-50fc-36bd-958b-5a33053c718b@nvidia.com>
Date:   Fri, 2 Oct 2020 01:23:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2bd44214-ff9c-0333-9525-3db29b9a3ff1@nvidia.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601626983; bh=hzeEWrUnnyq53wbqtk9/0M8fM/9LD/Z1zo+ELWApx+s=;
        h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=pQUo4jkbLg1wnxcAqAam7H+igCKIOsIxjsBoXd7G6JF5dC2oTDC32MVRUa+9wy5gf
         /UwQNsiCRKZ025hicOnzFyzWi0pbot0njV+HoyomHsYGKZ9q66b3uktU5R8ZGHuUCI
         qzXVOckOyPProRFXwJ0EgCKuRxLZaOaIujfeOu8KVeV5zn7ff7vzwyoHCInW+5iIaA
         IJLKabhWuwwmT5AlqV/VjG4gwrNW5VtQzTqpRXGjdZYJokODeudRt5+I5/m4jlOUHO
         /V6FkbSjKY1a+0BxPn1A1fbATftVGxFsWQTkqky+Raa2416id8B4sUVuzRzy4CL1Sz
         lndJzB1HzQlAg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/2/20 1:10 AM, John Hubbard wrote:
> On 10/2/20 12:59 AM, Stephen Rothwell wrote:
>> Hi John,
>>
>> On Thu, 1 Oct 2020 23:48:11 -0700 John Hubbard <jhubbard@nvidia.com> wro=
te:
>>>
>>> commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
>>> dependency") created the new check_config.sh file without the execute
>>> bits set. This is a problem because the Makefile runs it with "./", so
>>> now "make" is failing in that directory.
>>>
>>> The posted patch [1] does seem to have it as an executable file, so I'm
>>> not sure how this happened. But in any case, make check_config.sh
>>> executable again, so that "make" in selftests/vm works once again.
>>
>> The correct fix is to make sure that the Makefile runs it explicitly
>> with a shell because is such a patch is applied with patch(1), the
>> execute bit will not be preserved.
>>
>> See e.g. in the top level Makefile:
>>
>> =A0=A0=A0=A0$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
>>
>=20
> OK...we should also fix it anyway, seeing as how the run_vmtest.sh also n=
eeds
> the execute bit re-set, yes?
>=20

...and I should add that I'm stuck in a non-Kbuild system, here. So
$(CONFIG_SHELL) is not available, sigh.

> So I guess I should send a patch that does:
>=20
> * chmod +x on both run_vmtest.sh and check_config.sh, plus
>=20
> * invoke check_config.sh via $(CONFIG_SHELL) from the Makefile.
>=20
> Does that sound about right?
>=20
> thanks,

thanks,
--=20
John Hubbard
NVIDIA
