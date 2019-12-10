Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDBA118CDE
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 16:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLJPpK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 10:45:10 -0500
Received: from UPDC19PA20.eemsg.mail.mil ([214.24.27.195]:55912 "EHLO
        UPDC19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJPpK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 10:45:10 -0500
X-EEMSG-check-017: 37154421|UPDC19PA20_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="37154421"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UPDC19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Dec 2019 15:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575992707; x=1607528707;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Q8ZkjpIjErSBY1Oztsf2gl0a6tMyNCQL8uSupMKOm3o=;
  b=YMSksKg1NblpE0nhsoyVRZ0nALqSZydxFH01pzfvpqiznlIH853BAPR9
   FmqvNMFoQ+CJxadNpUVLJ4z2LsBQp1BeLaqK9gVqhKkCv89Tgt3S0ml32
   AdW3P9rJhKH1dFnrhmQ2ff4lVrB57V8NuHjV40PAUMAcIvoNH84RgeLo1
   GOnFgLEedHsIeBBQnbmQY1RQWDzA7nObh8zeccyd5p1z7dxNgiuktVE7E
   a3EN7VuS9bj5XsaB+/CNsB5T9Vhab+HLoCTqtZLiOC1a7ZVMD23+g1Eac
   DbQzvSuXv2785DVY9DC8j1lxlAHyWon+8ATGRh6vwwWPjZuhDTJBlexxM
   g==;
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="30944237"
IronPort-PHdr: =?us-ascii?q?9a23=3A5clTiBDdWf8M7557ByttUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP36p8mwAkXT6L1XgUPTWs2DsrQY0rGQ6vG7EjNQqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmssAncsscbjYRgJ6sy1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
 =?us-ascii?q?ZNUsNXWiNPGIO8a5YEAfQHM+hWsoLxo0ICoBu6CAWpAu7k1z1GiWLs3aAizu?=
 =?us-ascii?q?ovDw/G0gwjEdwAvnvbo9f6O7sdX+2u0KnFzy/OY+9K1Trz6oXFdA0qr/GWXb?=
 =?us-ascii?q?J3dMrc0VQhFx/bgVWIqYzqITWV3fkQvWie9eVgUeavhHAnqgpspTWv3dojip?=
 =?us-ascii?q?LSi4IJylHL6SV5wIEvKd2+U050e8SoEJRXtyGELoZ7RN4pTWJwuCsi17ELtp?=
 =?us-ascii?q?G2cDIKxZg63RLTdfOKf5aS7h7+UuuaPC12i2h/eL2lgha/6U2gyurhWcaqyF?=
 =?us-ascii?q?tKtS9FksXUtnAKyhzT9tCLSvtj8Uel3jaCzxzT5fteIUA1iKrbMIQtwr82lp?=
 =?us-ascii?q?odtkTDBTH5l1nsgK+KdkQr5uio6+P9brXgupCcLJN7hhv7MqQvnsyzGeU4Mg?=
 =?us-ascii?q?4QUGiH4emwybLu8ELjTLhKk/E6iLfVvZ/EKcgBu6K1GwpV3Zwi6xa7ATemyt?=
 =?us-ascii?q?MYnXwfIVJeZR2HlJPkO03OIf/kDfe/hE6gkDFwx//cJLHhDZLNLmbbnLf7Yb?=
 =?us-ascii?q?l981JcyBY0zd1H/5JbEKwBIPboV0/prtPYExs5PxWxw+bgD9V9zJ0RVXiTDa?=
 =?us-ascii?q?+eNaPYqUWI6f43I+mQeI8Vvy7wK+M76P7qjH85n0IdfKay0JsJZ3C3AO5mL1?=
 =?us-ascii?q?+aYXXymNcBF3kFvg4kQOztkl2CXiZZZ2yuUKIk+jE7FIWmAJ/HRoCshryBwS?=
 =?us-ascii?q?i6EoRNZm9YFl+MDG3od4SYW/YMcS6SJ8hhnSEZVbilVYAszg+utADkxLp9NO?=
 =?us-ascii?q?bU+TMXtYjl1Ndr4+3fjxYy9SZ7D86FyWGCU3l0nn8URz8xxK1/pU19ylGe0a?=
 =?us-ascii?q?l3mvBYE8Jc5vxVUgohK57cwPJ1C8roVgLCYNiJUlCmTcuiAT0rSdIx2dAOaV?=
 =?us-ascii?q?5nG9q+lhDDwzaqA7gNmryJHpM096Xc32LrJ8Z80HbLz60hj1ggQstSOmyqnK?=
 =?us-ascii?q?t/9wnPCI7TlEWZjKGqdaoA3CLX6GiDym+O7wlkV1tIWLjBFVUYYVHb5YDh71?=
 =?us-ascii?q?7GZ6enFLBiNwxG08PEIaxPPI7Hl1JDEcz/NczebmT5oGK5ARKF1/vYd4bxU3?=
 =?us-ascii?q?kM1yXaTk4fmkYc+mjQZlt2PTuov2+LVG8mLlnoeU65tLAj+X4=3D?=
X-IPAS-Result: =?us-ascii?q?A2AuAQB5vO9d/wHyM5BlGwEBAQEBAQEFAQEBEQEBAwMBA?=
 =?us-ascii?q?QGBfgKBcoFtIBIqhAOJA4ZmAQEBAQEBBoESJYlpkUYJAQEBAQEBAQEBNwEBh?=
 =?us-ascii?q?EACgic5BQ0CEAEBAQQBAQEBAQUDAQFshUOCOykBgnoBBSMVQRALGAICJgICV?=
 =?us-ascii?q?wYNBgIBAYJfP4JTJa4KgTKFT4M3gUiBDigBjDF5gQeBOAwDgl0+h1mCXgSWf?=
 =?us-ascii?q?EaXIoI5gjuTLwYbmjirDSGBWCsIAhgIIQ+DJ1ARFJtKIwMwjysBAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 10 Dec 2019 15:45:06 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xBAFio4K022667;
        Tue, 10 Dec 2019 10:44:51 -0500
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown
 reason
To:     Paul Moore <paul@paul-moore.com>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
References: <157594493094.748324.9234611948545428995.stgit@chester>
 <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov>
 <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <a11bfefc-c010-36ca-2303-35dcd4e9aa41@tycho.nsa.gov>
Date:   Tue, 10 Dec 2019 10:45:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/10/19 10:04 AM, Paul Moore wrote:
> On Tue, Dec 10, 2019 at 9:59 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>> On 12/9/19 9:28 PM, Paul Moore wrote:
>>> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
>>> a problem where the lockdown reason table is missing.  This patch
>>> attempts to fix this by hiding the table behind a lookup function.
>>
>> Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and
>> CONFIG_SECURITY?  When/why would we want it built without
>> CONFIG_SECURITY enabled?
> 
> My first thought of a fix was just that, but I remembered that the
> capabilities code is built regardless of the CONFIG_SECURITY setting
> and I thought there might be some value in allowing for lsm_audit to
> be used in commoncap (although in full disclosure commoncap doesn't
> currently make use of lsm_audit).

Seems contrary to normal practice, i.e. if/when commoncap grows a 
dependency, it can be changed then.


