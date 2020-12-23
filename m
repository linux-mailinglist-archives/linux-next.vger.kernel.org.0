Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871512E18F8
	for <lists+linux-next@lfdr.de>; Wed, 23 Dec 2020 07:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgLWGcW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Dec 2020 01:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgLWGcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Dec 2020 01:32:21 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E7EC0613D3;
        Tue, 22 Dec 2020 22:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=m5ILbdcQ6P+092Tz/2k/2qb7by+nGxMpsOr68tTBfsk=; b=ZlemMwBy69THO/CJ0DX9Hir0W9
        RA7Hpanmvq27+Rs6gam2psW/aiCdA4Avrael3L/peGyqWVzdiNWLA7hnu0ah0nX1W+0wGhLYe7sg7
        KSqmkAy1Dp9X75lCiwfqEOILvymmnAPEHRW/jmyWfxgBCeZTWr8uZWlJlwZZST7i2LOVyWRKmCpq8
        7O7iml6HED+sUT/hobOBTIYYrXTMQRauB2jGrqu0WQxcV0r9xrHybaQs0Z8tv6EHIQJEh8dywpo1v
        2LkwZ/hII2SJp/rZBHp6oV6IffusAwisTR1Tg+MhOMua+Q2fjAen8E7gvcc47xPTNyW/eAez9Vfmf
        u3CdO+Ig==;
Received: from [2601:1c0:6280:3f0::64ea]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1krxgQ-0007vs-Og; Wed, 23 Dec 2020 06:31:38 +0000
Subject: Re: linux-next: Tree for Dec 21 (objtool warning)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20201221141811.33dedcbe@canb.auug.org.au>
 <161c578e-c8c2-a730-a772-5d69909f5b7c@infradead.org>
 <20201223050958.z2nkn6h3l3lyeckg@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <abbcbfb7-9931-f05d-8319-b66b7a6fe3d4@infradead.org>
Date:   Tue, 22 Dec 2020 22:31:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201223050958.z2nkn6h3l3lyeckg@treble>
Content-Type: multipart/mixed;
 boundary="------------619C671257ABFDCC4CC50D06"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------619C671257ABFDCC4CC50D06
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/22/20 9:09 PM, Josh Poimboeuf wrote:
> On Mon, Dec 21, 2020 at 08:03:17AM -0800, Randy Dunlap wrote:
>> On 12/20/20 7:18 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> News: there will be no linux-next releases between Dec 24 and Jan
>>> 3 inclusive.
>>>
>>> Please do not add any v5.12 destined code to your linux-next included
>>> branches until after v5.11-rc1 has been released.
>>>
>>> Changes since 20201218:
>>>
>>
>> on x86_64:
>>
>> arch/x86/kernel/sys_ia32.o: warning: objtool: cp_stat64()+0xd8: call to new_encode_dev() with UACCESS enabled
> 
> Can you send a .o for this one?  Please gzip it because my email has
> been rejecting .o files lately :-/
> 

Sure, it's attached.

-- 
~Randy


--------------619C671257ABFDCC4CC50D06
Content-Type: application/gzip;
 name="sys_ia32.o.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="sys_ia32.o.gz"

H4sICNXY4l8AA3N5c19pYTMyLm8A7JwNdBTlvcYnX5BAYhBiQYWaKiqtkA8aEAVxI4GsbSS0
JBAsMLtkNySwJGGzCUH5WAp+rIsavVTTFnW19Iqa9lClLVLabpAKWnoFxY/eozVYUSyoWLGi
UnN3ss+bfefZeRPYe+85vefcOeLs+5vnff7/eWfmPx+Z3bXTy2YkJyVpYkrSpmqxljQ5Yh9t
+P8obaQWOBX4vLLzaE7nW5m27F91d3alr3tL00502wNHMg7Yu9MMZcapBc9U2jvfykXbnvHK
TiOGaAaOHNWkZnQW6XJ94LPrA88Xhp8+N6qyrz9eK0R3rt5lD1SGygLTt0bm2z5+oiywLwLb
i9cd7o4sLwiXBG7YYQ80h+2B6e1lgcoDphDtzz1TEpxZUBnLoHj9Z93N56BdEsyKzmYUFa8/
JfOemTs6e0xL6tZ8drc9mHqp0Q76hwzjtcDslrAvAx+PDceH7MEk3Rn6sLu7e20v2PH3SFMs
vOrV7NtuSTZS/Qyora0t9im4ZgwaR5d82d0diKx2EtkHZ+QGijOPZaL93pjkuGQDxVWx5elx
y7N/PSM1UDwkJjmSxJLgjPRAcU5M8UycoiRw/YjY8p9YLC8eGVu+PrY8uGasWMXb/hldxeLc
mHJenFNkjSdFNGNjmglWGlug2BaTDLWSRFxKYpIP4zZvRDIrUGyPSfZbSaoCxWUxyWNWEkeg
eFZMcquVpDZQXHGsd2eq4eHPDBQXxRaXcvdb/dHtPCmmucSsie1WheFjX4mDPTulcTgHjsy2
B16y3/mDWmMvXXe8LWbRc6hFdvnB9nYR5CL7nb/sEQbeFKKbT8f27nb7uj2Gwfd6nT8WHeKd
e4+p5lHxrpdKrlFPe7vh+rRR1Xqto0kHvvz95rgQFpH6DLj9C+uAhc/9b0SboYhmD65w2IOl
tfbg2kajUpo3e+c7ufaMZ62LrNEzWFoVXDvmbPvNjURcQRGP5nzem2BEFNEEV1TZTeZHP/pM
ltiD5fZI5pPYr/NwrjlmIBx40Z7RqcqmvDG6/nMdZcHSMUbUPkxKAnuVPv9S2cy1l/VkI7Zu
uc0wMpKKnU6nR0qhsaWEZ1nGbt5q7SbPxrIerx7PyMYpz416jvlveIr85k6iPVA26XMfNHIJ
zq017ytn2v3/4jAZOxp2rnfi9otel/a+B8vYz6IDdrYm5bbI6tmjqZRG93UxZIdNq/eWvHqd
9ozd6tUrz414RjIyMuvxrOodsgQ9IxZGdyyIXChuMdcXXpzDi+3m5Q9+ZlWeymm3OzrKJNs5
QhPXnyOCK8ZELjOPWpXvwG773rB8zXbLi83XlwRvOC3ae8N/iywt/rSzO1vTmvOCN5wMVp4o
7nwvM9h8PLj6qHHpGllSEpx+Sn1aeO4Ze+BUZSTjaO4lQVujOfVnT0qpa/8//YtMJ/f+4PKd
T/3mFzvWF2wx2pb3WH1Mux8Yfc3zn2QNW1a1aYHRTjnL/qsv/rL2yYWVnyYa/6LLPFOfeOCy
V6Y++Zuw0U4+y/73//GN5be8u+vXifZ3zbo354maXfMS7f+jW6eV/OOOR3+faP9PN9++9KFn
V/ws0f7nz3m70jNw+MJE+z+dsuC6ijVfSUm0/6BbLrc9nzZqcqL9i35541eeumXqiUT7Z7d/
bejuIY/4E+4/sHxR9/NVNyTaf3ty0trurx2/PNH+64asKRx67KrkRPvf/v68OZ0TXrIn2r/K
nq6tGne4OtH+8zv+cM3jFx8uTLT/+NGdM+dcP01PePu9dNfgix+9Npxo/99p1yxPH7bgukT7
716bl+VeZHsj0f4TrxmVffzgxA2J9i++dn3FG2/M/ijR/osfWrMoeWpLRaL9pzScd+6gFzY6
E+0/77WKyw7fPf/lRPtf+mjpjReOfjfh+vvq5PCS82fWNyXaf/JNa74xbtvj2xLtX5q2bE72
lwXpifbPenh2wbZPNu1KtH/HXWOHjfxxYcYDqZfkGO3rzrL/HY6Xlu8uW/L3ROO/vPrF9NX3
3T11Xsvs94126ln2Hx7MHPLgPX9tTjT+v80+5UormvZlovF/++EzTd2dJxOun+s/br1564yO
I4nGf/fheSXTTlU4Eo2ff8/HE3IGXXMy9MCc8xOJ7743Kd39XNELicb/aPgjvvyr7hriDX3r
IaOddpb9Wx6vmbBq78h1Zxv/GxOuLJbbf/v8q3edZegzmvL6Wf7PhYe+u2JCXULjl5Jhbhcl
paT0Xr97NalhWtLTyE76Y/bPj2YnPR/57yxC/stPlfa9e425+OMP36tWKhbk1zYsc+d7Xc31
Hmdjvqe+Nb/e3erL99TVN7eOMz6OG18wvqBw/PjC/KqJRflOb3VtfuukiflL3d56tye/aWWT
Xuf85vi8xdUuZ6SqT5t2de6Y2ZWzp+eWGQ5fz70yb0JeQR95G/dNqdpH3VbLUhR3VSmKu7UU
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
--------------619C671257ABFDCC4CC50D06--
