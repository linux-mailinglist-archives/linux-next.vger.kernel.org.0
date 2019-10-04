Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7D7CB5AE
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 10:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbfJDIEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 04:04:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11076 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730954AbfJDIEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 04:04:12 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x947vlpQ016326
        for <linux-next@vger.kernel.org>; Fri, 4 Oct 2019 04:04:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ve1ea1u0n-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2019 04:04:10 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Fri, 4 Oct 2019 09:04:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 4 Oct 2019 09:04:05 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x94844Bl52756608
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 4 Oct 2019 08:04:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9157442045;
        Fri,  4 Oct 2019 08:04:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 36C964203F;
        Fri,  4 Oct 2019 08:04:04 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.146])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  4 Oct 2019 08:04:04 +0000 (GMT)
Subject: Re: [PATCH v3] docs: Use make invocation's -j argument for
 parallelism
To:     Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <201909241627.CEA19509@keescook>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 syiRa+UVlsKmx1hsEg==
Date:   Fri, 4 Oct 2019 10:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201909241627.CEA19509@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19100408-0028-0000-0000-000003A5EA3F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100408-0029-0000-0000-00002467F3FB
Message-Id: <0d2433cc-8f97-174f-4835-1fead9e7fe16@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-10-04_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=726 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040074
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 25.09.19 01:29, Kees Cook wrote:
> While sphinx 1.7 and later supports "-jauto" for parallelism, this
> effectively ignores the "-j" flag used in the "make" invocation, which
> may cause confusion for build systems. Instead, extract the available
> parallelism from "make"'s job server (since it is not exposed in any
> special variables) and use that for the "sphinx-build" run. Now things
> work correctly for builds where -j is specified at the top-level:
> 
> 	make -j16 htmldocs
> 
> If -j is not specified, continue to fallback to "-jauto" if available.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v3: python2, specific exceptions, correct SPDX, blocking writer
> v2: retain "-jauto" default behavior with top-level -j is missing.              
[...]
> diff --git a/scripts/jobserver-count b/scripts/jobserver-count
> new file mode 100755
> index 000000000000..0b482d6884d2
> --- /dev/null
> +++ b/scripts/jobserver-count
> @@ -0,0 +1,58 @@
> +#!/usr/bin/env python


This breaks our daily linux-next build for an fedora 30 rpm on s390x:

+ /usr/lib/rpm/redhat/brp-mangle-shebangs
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/profile2linkerlist.pl from /usr/bin/env perl to #!/usr/bin/perl
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/headerdep.pl from /usr/bin/env perl to #!/usr/bin/perl
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/package/buildtar from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/package/builddeb from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/package/mkspec from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/package/mkdebian from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/checksyscalls.sh from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/gen_ksymdeps.sh from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/makelst from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/checkversion.pl from /usr/bin/env perl to #!/usr/bin/perl
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/gcc-plugin.sh from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/gfp-translate from /bin/bash to #!/usr/bin/bash
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/tags.sh from /bin/bash to #!/usr/bin/bash
*** ERROR: ambiguous python shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/jobserver-count: #!/usr/bin/env python. Change it to python3 (or python2) explicitly.
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/adjust_autoksyms.sh from /bin/sh to #!/usr/bin/sh
mangling shebang in /usr/src/kernels/5.4.0-20191004.rc1.git155.311ef88adfa3.301.fc30.s390x+next/scripts/kernel-doc from /usr/bin/env perl to #!/usr/bin/perl
[...]


