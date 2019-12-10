Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61967118D98
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 17:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfLJQ1i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 11:27:38 -0500
Received: from UCOL19PA37.eemsg.mail.mil ([214.24.24.197]:16459 "EHLO
        UCOL19PA37.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfLJQ1i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 11:27:38 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Dec 2019 11:27:37 EST
X-EEMSG-check-017: 59491598|UCOL19PA37_ESA_OUT04.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="59491598"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UCOL19PA37.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Dec 2019 16:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575994830; x=1607530830;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Uh7uFwnVRsZ/pbpkqagdYZ/VIUdFbeuj7CLdN8X21gg=;
  b=Dv4ceiGj/2ypMyTSikC+KIbQn7LU1j1LRWN8Od3eN+z26bULoorLldgi
   7UIGdLb+kxpmJaLhq3bndj2rBSbeBhLZ+l8EeMTaVrdv8Non9SCTZrh5h
   6GK67Epoe0COhiA/BQLnPjBTzC+gWwdFJ+XzfGpxLyigTFNJtN/eFzSyN
   A7Fq/ZlPpip+mPBU2Sqbyu9aA8vUUoMgz/3bhA/xMImaFC1BmHS14MIqQ
   3s5NDXNWxmlpaRnfaCoXYdPikhkDMheQv2MwO1nqxV7Z5Bqwr9x9TnBbs
   V0RPDQF8RnR0tYgjysh2sCpCvf9bOccl6Oqus5cb+FLCeopui5iJdiSNs
   A==;
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="30947688"
IronPort-PHdr: =?us-ascii?q?9a23=3AqaApQxdUFB1yhW+h6DNQkr79lGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxc27ZBGN2/xhgRfzUJnB7Loc0qyK6vumAD1bqsbd+Fk5M7V0Hy?=
 =?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
 =?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAi4oAnLq8UbhYVvJqkyxx?=
 =?us-ascii?q?bGv3BFZ/lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3?=
 =?us-ascii?q?g668P3uxbDSxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RT?=
 =?us-ascii?q?Gv5LplRRP0lCsKMSMy/XrJgcJskq1UvBOhpwR+w4HKZoGVKOF+db7Zcd8DWG?=
 =?us-ascii?q?ZNQtpdWylHD4yydYsPC/cKM/heoYfzulACqQKyCAmoCe/qzDJDm3340rAg0+?=
 =?us-ascii?q?k5DA/IwgIgEdINvnraotr6O6UdXvy6wqTT0TXObelb1Svh5IXGcB0sp+yHU7?=
 =?us-ascii?q?JqccrWzEkiDx7LjkmOpoz9PzOayOINuHWG4eplT+2vj2onpB9xozOywcoskZ?=
 =?us-ascii?q?TGhpkOx1DY9SR23IY1JdqiRE59et6rCoFcty6dN4toW84vRXxjtiUiyrAepJ?=
 =?us-ascii?q?K2cycHxI4nyhLCcfCLbYeF7gz5WOqMJzpzmWhrd6ilhxmo9Eit0uj8Vs6p31?=
 =?us-ascii?q?lUtidFidzMtmwV1xzU98iHVuNx/ke/1jaL0ADe8v1ELloularaNp4h2aQ8lp?=
 =?us-ascii?q?sVsUTNGS/2g1v5g7OMekU4+umn9+TnYrL8qp+aK4B0kR3xPr4rmsy+BeQ0Kg?=
 =?us-ascii?q?kOX26F9uSgzLDv4EL0TbpQgvA2j6XVqo7WKMsFqqKjHgNZyoMj5Ay+Dzei3t?=
 =?us-ascii?q?QYh34HLFdddRKckofpIErDIOz4DPijg1Ssly1nx/bdPrL7GJnNIX/DkKn5cb?=
 =?us-ascii?q?Zn90Fc0BYzzcxY559MErEOOu/zWkvqudzAFBA5Lgi0z//iCNV60YMeQ3yADr?=
 =?us-ascii?q?WFP6PVtF+C/vgvLPWUZI8JpDb9LOAo5+Xwgn89mF8de7Sp3JQMZXCmEfRpPV?=
 =?us-ascii?q?+ZbWDvgtgfC2cKuBQxTOjwhF2FSz5TaG64X7gg6TEjFIKmEYDDS5ipgLyA2i?=
 =?us-ascii?q?e7A5JXanldCl+SDXjoap+EW/YQaCOSO8NhlzsEWqW8S48lyx6jrxH6y7V5Ie?=
 =?us-ascii?q?rO4CEYtozs1MJz5+LNkRE+7zt0D96S02uVVWF7gnsIRyMq3KB4uUF9zlaD0a?=
 =?us-ascii?q?5lg/1XDNBT4e1GUwgmNZPH0ex6BM79WhjbcteKVlmmWNOmDi81Tt4rxN8OeU?=
 =?us-ascii?q?l9Ec24jh/fxyqqH6MVl7uTCZw26K3c2n/xJ9xny3bHz6kslF0mQspJNW27ia?=
 =?us-ascii?q?9z7Q3TB4/VnEWDkKaqbqMc3CDR9GuZ0WWOu0RYA0ZMVvD9VG0bLm7Rqs70rh?=
 =?us-ascii?q?faRqKqIawuLw8EzMmFMKYMYdrs2wZoXvDmbe/CbnqxlmH4PhOBwreBfcK+YG?=
 =?us-ascii?q?kG9DnMA0gD1QYI9DCJMhZoVXTpmH7XEDE7TQGnWEjr6+Qr7SrmH0I=3D?=
X-IPAS-Result: =?us-ascii?q?A2BrAgCbxO9d/wHyM5BlHAEBAQEBBwEBEQEEBAEBgX6Bd?=
 =?us-ascii?q?IFtIBIqhAOJA4ZnAQEBAQEBBoESJYlpkUYJAQEBAQEBAQEBNwEBhEACgic4E?=
 =?us-ascii?q?wIQAQEBBAEBAQEBBQMBAWyFQ4I7KQGCegEFIxVBEAsYAgImAgJXBg0GAgEBg?=
 =?us-ascii?q?l8/glMlriCBMoVPgzmBSIEOKIwyeYEHgTgMA4JdPodZgl4EjWWJF0aXIoI5g?=
 =?us-ascii?q?juTLwYbmjirDCKBWCsIAhgIIQ87gmxQERSbSiMDMI8rAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 10 Dec 2019 16:20:29 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xBAGKFUF041526;
        Tue, 10 Dec 2019 11:20:15 -0500
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown
 reason
To:     Paul Moore <paul@paul-moore.com>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
References: <157594493094.748324.9234611948545428995.stgit@chester>
 <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov>
 <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
 <a11bfefc-c010-36ca-2303-35dcd4e9aa41@tycho.nsa.gov>
 <CAHC9VhRjs-pMWD-2ZTcF42eR3ugW7Bn7uYhmp4cQFneOtcqUkg@mail.gmail.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <85a3c4ce-0636-30e7-21bf-dfcd4be5cd9c@tycho.nsa.gov>
Date:   Tue, 10 Dec 2019 11:20:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRjs-pMWD-2ZTcF42eR3ugW7Bn7uYhmp4cQFneOtcqUkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/10/19 10:58 AM, Paul Moore wrote:
> On Tue, Dec 10, 2019 at 10:45 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>> On 12/10/19 10:04 AM, Paul Moore wrote:
>>> On Tue, Dec 10, 2019 at 9:59 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
>>>> On 12/9/19 9:28 PM, Paul Moore wrote:
>>>>> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
>>>>> a problem where the lockdown reason table is missing.  This patch
>>>>> attempts to fix this by hiding the table behind a lookup function.
>>>>
>>>> Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and
>>>> CONFIG_SECURITY?  When/why would we want it built without
>>>> CONFIG_SECURITY enabled?
>>>
>>> My first thought of a fix was just that, but I remembered that the
>>> capabilities code is built regardless of the CONFIG_SECURITY setting
>>> and I thought there might be some value in allowing for lsm_audit to
>>> be used in commoncap (although in full disclosure commoncap doesn't
>>> currently make use of lsm_audit).
>>
>> Seems contrary to normal practice, i.e. if/when commoncap grows a
>> dependency, it can be changed then.
> 
> Okay, want to submit a tested patch?  I really would like to get this
> fixed before today's linux-next run.

In looking at it, I'm wondering if we could just change the Makefile to 
use obj-$(CONFIG_SECURITY) instead of obj-$(CONFIG_AUDIT) for 
lsm_audit.c.  I think it might build just fine without CONFIG_AUDIT 
since audit.h provides static inlines that boil away to nothing for 
audit_log*() in that case. Offhand I don't see any support/examples of 
specifying two different config options for an obj list in a Makefile.

The other option would be to introduce its own CONFIG_LSM_AUDIT option 
and select that option automatically for the modules that use it, which 
would currently be selinux, apparmor, and smack.  Then if you aren't 
using any of those modules you can omit it from your kernel.

